import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/sura_push.dart';
import 'package:again_islami/moduels/layout/quran/widget/quran_list.dart';
import 'package:again_islami/moduels/layout/quran/widget/sura_data.dart';
import 'package:flutter/material.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    late SuraData suraData;
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/q.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset(
              'assets/images/Logo8.png',
              height: size.height * 0.2,
              width: size.width * 1,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                style: TextStyle(
                    color: AppColor.primary, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'Sura Name',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColor.primary),
                  ),
                  labelStyle: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.bold),
                  hintStyle: TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.bold),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 22, bottom: 10, top: 10),
                    child: ImageIcon(
                      AssetImage('assets/icons/quran.png'),
                      color: AppColor.primary,
                    ),
                  ),
                  fillColor: AppColor.whites.withOpacity(0.05),
                  filled: true,
                ),
                cursorColor: AppColor.primary,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.topLeft,
              child: Text(
                'Most Recently ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColor.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: 285,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('Al-Anbiya',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('الأنبياء',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('122 Verses', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    Spacer(),
                    Image.asset('assets/images/quran_search.png'),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.topLeft,
              child: Text(
                'Suras List ',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColor.primary),
              ),
            ),
            // ListView.separated(
            //   itemBuilder: (context, index) {
            //     return  ;
            //   },
            //   separatorBuilder: (context, index) => Divider(
            //     indent: size.width*0.1,
            //     endIndent: size.width*0.1,
            //     thickness: 4,
            //     color: AppColor.primary,
            //   ),
            //   itemCount: 114,
            // ),
          ],
        ),
      ),
    );
  }
}
