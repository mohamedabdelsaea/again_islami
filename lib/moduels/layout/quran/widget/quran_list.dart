import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/widget/sura_data.dart';
import 'package:flutter/material.dart';

class QuranList extends StatelessWidget {
  // final SuraData suraData;

  const QuranList({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/sura_icon.png'),
              )),
          alignment: Alignment.center,
          child: Text(
            99.toString(),
            style: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'Al-Fatiha',
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              '7 verses',
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          'الفاتحه',
          style: TextStyle(
            color: AppColor.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
