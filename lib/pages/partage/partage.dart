import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Partager extends StatelessWidget {
  Partager({super.key, this.fontPackage});

  final categories = [
    {
      'icon': Icons.facebook,
      "color": Color.fromARGB(255, 8, 0, 255),
      "title": 'Facebook',
    },
    {
      'icon': Icons.messenger,
      "color": const Color(0xFF605CF4),
      "title": 'Arcade',
    },
    {
      'icon': Icons.youtube_searched_for_sharp,
      "color": Color.fromARGB(255, 247, 53, 53),
      "title": 'Arcade',
    },
    {
      'icon': Icons.chrome_reader_mode,
      "color": const Color(0xFF605CF4),
      "title": 'Arcade',
    },
    {
      'icon': Icons.tiktok,
      "color": Color.fromARGB(255, 0, 0, 0),
      "title": 'Arcade',
    },
  ];

  final String? fontPackage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 245, 84),
        centerTitle: true,
        title: const Text(
          "PARTAGER1",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 200, right: 15),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => Column(
                              children: [
                                Icon(
                                  categories[index]['icon'] as IconData,
                                  color: categories[index]['color'] as Color,
                                  size: 40,
                                )
                              ],
                            )),
                        separatorBuilder: ((context, index) => const SizedBox(
                              width: 33,
                            )),
                        itemCount: categories.length),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
