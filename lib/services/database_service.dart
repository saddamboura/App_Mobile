import 'package:generateur/model/historique.dart';
import 'package:generateur/model/setting.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  final String _historiqueTable = "historique";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  static const historique = '''
        CREATE TABLE IF NOT EXISTS historique(
         id INTEGER PRIMARY KEY,
         content TEXT NOT NULL,
         createdAt TEXT NOT NULL,
         status INTEGER DEFAULT 0 NOT NULL
        ) 
        ''';
  static const settings = '''
        CREATE TABLE IF NOT EXISTS setting(
         id INTEGER PRIMARY KEY,
         minVal INTEGER DEFAULT 0 NOT NULL,
         maxVal INTEGER DEFAULT 100 NOT NULL
        ) 
        ''';
  static const defaultSetting = '''
INSERT INTO setting (minVal, maxVal) VALUES (0, 100)
''';
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "randomNumber.db");
    deleteDatabase(databasePath);
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(historique);
        await db.execute(settings);
        await db.execute(defaultSetting);
      },
    );
    return database;
  }

  void addTask(
    String content,
    String createdAt,
  ) async {
    final db = await database;
    await db.insert(
      _historiqueTable,
      {
        'content': content,
        'createdAt': createdAt,
      },
    );
  }

  Future<List<History>?> getHistory() async {
    final db = await database;
    final data = await db.query("historique");
    List<History> history = data
        .map((e) => History(
            id: e['id'] as int,
            content: e['content'] as String,
            createdAt: e['createdAt'] as String,
            status: e['status'] as int))
        .toList();
    return history;
  }

  void deleteHistory() async {
    final db = await database;
    final data = await db.delete("historique");
  }

  // Get param data

  Future<List<Setting>?> getSetting() async {
    final db = await database;
    final data = await db.query("setting", where: "id= ?", whereArgs: [
      1,
    ]);
    // print(data);
    List<Setting> setting = data
        .map((e) => Setting(
              minVal: e['minVal'] as int,
              maxVal: e['maxVal'] as int,
            ))
        .toList();
    return setting;
  }

  void updateParam(int minVal, int maxVal) async {
    final db = await database;
    await db.update(
      'setting',
      {
        'minVal': minVal,
        'maxVal': maxVal,
      },
    );
  }
}
