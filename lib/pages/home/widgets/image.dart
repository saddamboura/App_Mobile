import 'package:flutter/material.dart';

class ImageMenu extends StatelessWidget {
  const ImageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/nombres-aléatoires-de-fond.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Stack(
        children: [
          Positioned.fill(
              left: 30,
              child: Align(
                alignment: Alignment.center,
                child: Text("Générateurs des Nombres Aléatoires",
                    style: TextStyle(color: Colors.white, fontSize: 50)),
              ))
        ],
      ),
    );
  }
}
