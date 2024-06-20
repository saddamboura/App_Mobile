import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generateur/model/historique.dart';
import 'package:generateur/model/setting.dart';
import 'package:intl/intl.dart';

import 'package:generateur/pages/partage/partage.dart';
import 'package:generateur/services/database_service.dart';

class Historique extends StatefulWidget {
  const Historique({super.key});

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  final DatabaseService _databaseService = DatabaseService.instance;

  // final minVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 245, 84),
        centerTitle: true,
        title: const Text(
          "HISTORIQUES",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _databaseService.deleteHistory();
              setState(() {});
            },
            icon: const Icon(Icons.delete, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _databaseService.getHistory(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: ((context, index) {
                  History history = snapshot.data![index];
                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      history.content,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      history.createdAt,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.copy),
                                    SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Partager()));
                                      },
                                      child: const Icon(Icons.share),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ));
                }));
          })),
    );
  }
}
