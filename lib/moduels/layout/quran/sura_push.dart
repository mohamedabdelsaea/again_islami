import 'package:flutter/material.dart';

class SuraPush extends StatelessWidget {
  const SuraPush({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/Soura Details Screen.png'),
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
