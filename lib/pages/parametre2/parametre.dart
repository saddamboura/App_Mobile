import 'package:flutter/material.dart';
import 'package:generateur/pages/option/option.dart';
import 'package:generateur/widget/switch.dart';

class ParametreDeux extends StatelessWidget {
  const ParametreDeux({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 245, 84),
          centerTitle: true,
          title: const Text(
            "PARAMETRE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Min',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Max',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Durée',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Option()));
                        },
                        child: const Text(
                          "Plus d'option",
                          style: TextStyle(color: Colors.blue, fontSize: 30),
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          Text(
                            "Reinitialiser les options par défaut",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          SwitchApp()
                        ],
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Appliquer",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
