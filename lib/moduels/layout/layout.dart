import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/hadith/hadith_tap.dart';
import 'package:again_islami/moduels/layout/quran/quran_tap.dart';
import 'package:again_islami/moduels/layout/radio/radio_tap.dart';
import 'package:again_islami/moduels/layout/sbha/sbha_tap.dart';
import 'package:again_islami/moduels/layout/times/times_tap.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tap = [
      QuranTap(),
      HadithTap(),
      SbhaTap(),
      RadioTap(),
      TimesTap(),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        fixedColor: AppColor.lastColor,
        backgroundColor: AppColor.primary,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/quran.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/quran.png'),
                  color: AppColor.whites.withOpacity(0.7)),
              label: 'Quran'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/hadith.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/hadith.png'),
                  color: AppColor.whites.withOpacity(0.7)),
              label: 'Hadith'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/sbha.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/sbha.png'),
                  color: AppColor.whites.withOpacity(0.7)),
              label: 'Sbha'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/radio.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/radio.png'),
                  color: AppColor.whites.withOpacity(0.7)),
              label: 'Radio'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/times.png')),
              activeIcon: ImageIcon(AssetImage('assets/icons/times.png'),
                  color: AppColor.whites.withOpacity(0.7)),
              label: 'Timer'),
        ],
      ),
      body: tap[selectedIndex],
    );
  }
}
