import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/widget/sura_data.dart';
import 'package:flutter/material.dart';

class SuraPush extends StatelessWidget {
  final SuraData sura;

  const SuraPush({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Soura Details Screen.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.primary,
            ),
          ),
          centerTitle: true,
          title: Text(
            sura.nameEN,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              Text(
                sura.nameAR,
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.08),
              Expanded(
                child: Text(
                  '',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
