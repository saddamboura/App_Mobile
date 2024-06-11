import 'package:flutter/material.dart';
import 'package:generateur/pages/affiche/affiche.dart';

class BouttonMenu extends StatelessWidget {
  const BouttonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AffichePrincipal()));
      },
      child: Container(
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/melanger.png',
                height: 100,
                width: 300,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'NOMBRE ALEATOIRE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ], //[]
        ), //Column
      ),
    );
  }
}
