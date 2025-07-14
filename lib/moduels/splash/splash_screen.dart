import 'dart:async';

import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          PageRouteName.layout,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/SplashScreen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/SplashScreen2.png',
                height: size.height * 0.35,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.1),
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/SplashScreen3.png',
                height: size.height * 0.3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: size.height * 0.1),
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/SplashScreen4.png',
                height: size.height * 0.3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: size.height * 0.05),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                height: size.height * 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
