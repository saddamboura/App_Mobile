import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class ParametreUn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paramètre',
        theme: theme,
        darkTheme: darkTheme,
        home: MyHomePage(
          title: 'Paramètre',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkmode = false;
  dynamic savedThemeMode;
  // late String iconAdress;

  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      print('thème sombre');
      setState(() {
        darkmode = true;
        // iconAdress = 'assets/icon/dark-icon.png';
      });
    } else {
      print('thème clair');
      setState(() {
        darkmode = false;
        // iconAdress = 'assets/icon/ligth-icon.png';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text('Mode sombre'),
              activeColor: Colors.orange,
              secondary: const Icon(Icons.nightlight_round),
              value: darkmode,
              onChanged: (bool value) {
                print(value);
                if (value == true) {
                  AdaptiveTheme.of(context).setDark();
                  // iconAdress = 'assets/icon/dark-icon.png';
                } else {
                  AdaptiveTheme.of(context).setLight();
                  // iconAdress = 'assets/icon/ligth-icon.png';
                }
                setState(() {
                  darkmode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
