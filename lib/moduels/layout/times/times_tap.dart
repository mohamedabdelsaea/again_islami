import 'package:flutter/material.dart';

class TimesTap extends StatelessWidget {
  const TimesTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_t.png'),
            fit: BoxFit.cover

        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
