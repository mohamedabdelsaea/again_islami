import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/widget/sura_data.dart';
import 'package:flutter/material.dart';

class QuranList extends StatelessWidget {
  final SuraData suraData;

  const QuranList({super.key, required this.suraData});

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
          child: Text(suraData.id.toString()),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            suraData.nameEN,
            style: TextStyle(color: AppColor.primary),
          ),
          SizedBox(height: 10),
          Text(
            suraData.verses,
            style: TextStyle(color: AppColor.primary),
          ),
        ]),
        Text(
          suraData.nameAR,
          style: TextStyle(color: AppColor.primary),
        ),
      ],
    );
  }
}
