import 'package:again_islami/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  bool isSelectedColor = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/Background_radio.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Image.asset(
              'assets/images/Logo8.png',
              height: size.height * 0.2,
              width: size.width * 1,
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedColor = false;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isSelectedColor == false
                          ? AppColor.primary
                          : AppColor.gray,
                    ),
                    child: Text(
                      'Radio',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: isSelectedColor == false
                            ? AppColor.lastColor
                            : AppColor.whites,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedColor = true;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isSelectedColor == true
                          ? AppColor.primary
                          : AppColor.gray,
                    ),
                    child: Text(
                      'Reciters',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: isSelectedColor == true
                            ? AppColor.lastColor
                            : AppColor.whites,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset('assets/images/radio_1.png'),
                      SizedBox(height: 30),
                      Image.asset('assets/images/radio_2.png'),
                    ],
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
