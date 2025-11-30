import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/hadith/hadith_title.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late final HadithData hadithData;

class HadithTap extends StatefulWidget {
  const HadithTap({super.key});

  @override
  State<HadithTap> createState() => _HadithTapState();
}

class _HadithTapState extends State<HadithTap> {
  List<HadithData> ahadith = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadAhadith();
  }

  Future<void> loadAhadith() async {
    List<HadithData> loaded = [];
    for (int i = 1; i <= 50; i++) {
      try {
        String content = await rootBundle.loadString("assets/files/h$i.txt");

        List<String> lines = content.split('\n');
        String title = lines.first.trim();
        String body = lines.skip(1).join('\n').trim();

        loaded.add(HadithData(
          hadithTitle: title,
          hadithContent: body,
        ));
      } catch (e) {
        debugPrint("خطأ أثناء تحميل الحديث رقم $i: $e");
      }
    }
    setState(() {
      ahadith = loaded;
    });
  }

  Widget buildHadithCard(int index) {
    final hadith = ahadith[index];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(200),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('assets/images/Hadith Card.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              hadith.hadithTitle,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.lastColor,
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadith.hadithContent,
                textAlign: TextAlign.center,
                style:  TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.lastColor,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onHadithChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hadith_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Image.asset(
              'assets/images/Logo8.png',
              height: size.height * 0.2,
              width: size.width,
            ),
            Expanded(
              child: ahadith.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                itemCount: ahadith.length,
                itemBuilder: (context, index, realIndex) {
                  return buildHadithCard(index);
                },
                options: CarouselOptions(
                  height: size.height * 0.9,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: onHadithChanged,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
