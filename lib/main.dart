import 'package:flutter/material.dart';
import 'package:generateur/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Nombrre Aléatoire';
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomePage(),
    );
  }
}
