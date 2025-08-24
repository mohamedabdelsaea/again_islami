import 'package:again_islami/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SuraPush extends StatelessWidget {
  const SuraPush({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/Soura Details Screen.png'),
            fit: BoxFit.fill
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent,leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: AppColor.primary,)),),
        body: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
