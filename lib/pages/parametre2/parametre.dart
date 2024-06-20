import 'package:flutter/material.dart';
import 'package:generateur/pages/home/home.dart';
import 'package:generateur/pages/option/option.dart';
import 'package:generateur/services/database_service.dart';
import 'package:generateur/widget/switch.dart';

class ParametreDeux extends StatefulWidget {
  const ParametreDeux({super.key});

  @override
  State<ParametreDeux> createState() => _ParametreDeuxState();
}

class _ParametreDeuxState extends State<ParametreDeux> {
  DatabaseService db = DatabaseService.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSetting();
  }

  final TextEditingController minController = TextEditingController();
  final TextEditingController maxController = TextEditingController();
  Future<void> _getSetting() async {
    var setting = await db.getSetting();
    setState(() {
      minController.text = setting!.first.minVal.toString();
      maxController.text = setting!.first.maxVal.toString();
    });
  }

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
        body: FutureBuilder(
            future: db.getSetting(),
            builder: ((context, snapshot) {
              return SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: minController,
                          decoration: InputDecoration(
                            labelText: 'Min',
                          ),
                        ),
                        TextField(
                          controller: maxController,
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
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 30),
                              ),
                            ),
                            const SizedBox(height: 40),
                            const Row(
                              children: [
                                Text(
                                  "Reinitialiser les options par défaut",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SwitchApp()
                              ],
                            ),
                            const SizedBox(height: 50),
                            ElevatedButton(
                                onPressed: () {
                                  db.updateParam(
                                    int.parse(minController.text),
                                    int.parse(maxController.text),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: const Text(
                                  "Appliquer",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
