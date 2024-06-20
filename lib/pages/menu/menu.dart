import 'package:flutter/material.dart';

enum MyValues { francais, anglais }

class MenuUn extends StatefulWidget {
  const MenuUn({super.key});

  @override
  State<MenuUn> createState() => _MenuUnState();
}

class _MenuUnState extends State<MenuUn> {
  MyValues? _val = MyValues.francais;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 245, 84),
        centerTitle: true,
        title: const Text(
          "Menu Principale",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Text(
              "Choisir une langue :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                        value: MyValues.francais,
                        groupValue: _val,
                        onChanged: (MyValues? val) {
                          setState(() {
                            _val = val;
                          });
                        }),
                    const Text("Français")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: MyValues.anglais,
                        groupValue: _val,
                        onChanged: (MyValues? val) {
                          setState(() {
                            _val = val;
                          });
                        }),
                    const Text("Anglais")
                  ],
                )
              ],
            ),
            const Text(
              "A propos de l'application :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text(
                "Cette application est une application qui génère des nombres aléatoitres.  "),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Code source",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
