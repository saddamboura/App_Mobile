import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool val1 = false;
  bool val2 = false;
  bool val3 = false;

  void change1(bool? s) {
    setState(() {
      val1 = s!;
    });
  }

  void change2(bool? a) {
    setState(() {
      val2 = a!;
    });
  }

  void change3(bool? d) {
    setState(() {
      val3 = d!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 245, 84),
          centerTitle: true,
          title: const Text(
            "Plus d'options",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Pas de Duplication",
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                      Checkbox(value: val1, onChanged: change1),
                    ],
                  ),
                ),
                CheckboxListTile(
                  value: val2,
                  onChanged: change2,
                  title: const Text("Reset",
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                CheckboxListTile(
                  value: val3,
                  onChanged: change3,
                  title: const Text("Afficher la Somme",
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                  controlAffinity: ListTileControlAffinity.trailing,
                )
              ],
            ),
          ),
        ));
  }
}
