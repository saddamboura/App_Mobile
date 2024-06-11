import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generateur/pages/historique/historique.dart';
import 'package:generateur/pages/parametre2/parametre.dart';
import 'dart:math' show Random;

class AffichePrincipal extends StatefulWidget {
  const AffichePrincipal({super.key});

  @override
  State<AffichePrincipal> createState() => _AffichePrincipalState();
}

class _AffichePrincipalState extends State<AffichePrincipal> {
  int number = 0;
  var random = new Random();
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
              Container(
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    number.toString(),
                    style: TextStyle(
                      fontSize: 90,
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
                          number = random.nextInt(10);
                        });
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
