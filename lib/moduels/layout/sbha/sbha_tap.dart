import 'package:again_islami/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SbhaTap extends StatefulWidget {
  const SbhaTap({super.key});

  @override
  State<SbhaTap> createState() => _SbhaTapState();
}

class _SbhaTapState extends State<SbhaTap> {
  int num = 0;
  double angle = 0;
  int currantIndex = 0;
  List<String> tsbe7 = ['الحمدلله', 'الله اكبر', 'سبحان الله'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Background_sbha.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo8.png',
              height: size.height * 0.2,
              width: size.width * 1,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              tsbe7[currantIndex],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Image.asset('assets/images/Mask group.png'),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  num.toString(),
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onSbha,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      'assets/images/sbha_aa.png',
                      width: size.width * 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onSbha() {
    num++;
    angle += 30;
    if (num == 33) {
      num = 0;
      currantIndex++;
      if (currantIndex == 3) currantIndex = 0;
    }
    setState(() {});
  }
}
