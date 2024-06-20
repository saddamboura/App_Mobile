import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generateur/pages/historique/historique.dart';
import 'package:generateur/pages/parametre2/parametre.dart';
import 'dart:math' show Random;

import 'package:generateur/services/database_service.dart';
import 'package:intl/intl.dart';

class AffichePrincipal extends StatefulWidget {
  const AffichePrincipal({super.key});

  @override
  State<AffichePrincipal> createState() => _AffichePrincipalState();
}

class _AffichePrincipalState extends State<AffichePrincipal> {
  final DatabaseService _databaseService = DatabaseService.instance;
  int number = 0;
  int minVal = 0;
  int maxVal = 1;
  var random = new Random();

  String generateCurrentDate() {
    final now = DateTime.now();
    String formated = DateFormat('dd MMM yyyy').format(now);
    return formated;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSetting();
  }

  Future<void> _getSetting() async {
    var setting = await _databaseService.getSetting();
    setState(() {
      minVal = setting!.first.minVal;
      maxVal = setting.first.maxVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 245, 84),
          centerTitle: true,
          title: const Text(
            "NOMBRE ALEATOIRE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Historique()));
              },
              icon: const Icon(Icons.history, color: Colors.black),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  height: MediaQuery.of(context).size.height * 0.75,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: const TextStyle(
                        fontSize: 90,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          number = random.nextInt(maxVal);
                        });
                        _databaseService.addTask(
                            number.toString()!, generateCurrentDate());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .blue, // Par exemple, changer la couleur de fond en bleu
                      ),
                      child: const Text(
                        'Randomiser',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ParametreDeux()));
                        },
                        child: const Icon(Icons.settings, color: Colors.black))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
