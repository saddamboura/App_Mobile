import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:generateur/pages/home/widgets/bouton.dart';
import 'package:generateur/pages/home/widgets/image.dart';
import 'package:generateur/pages/menu/menu.dart';
import 'package:generateur/pages/parametre1/ParametreUn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color c1 = const Color(0xFFF5F5DC);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 245, 84),
        centerTitle: true,
        title: const Text(
          'GENERATEUR01 N&A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuUn()));
          },
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ParametreUn()));
            },
            icon: const Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Espace pour l'
            ImageMenu(),

            SizedBox(height: 50),
            BouttonMenu(),
          ],
        ),
      ),
      backgroundColor: c1,
    );
  }
}
