import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/widget/sura_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraPush extends StatefulWidget {
  final SuraData sura;

  const SuraPush({super.key, required this.sura});

  @override
  State<SuraPush> createState() => _SuraPushState();
}

class _SuraPushState extends State<SuraPush> {
  List<String> versesList = [];

  @override
  void initState() {
    super.initState();
    loadData(widget.sura.id.toString());
  }

  void loadData(String suraId) async {
    try {
      String content =
      await rootBundle.loadString('assets/files/$suraId.txt');
      setState(() {
        versesList = content.split('\n');
      });
    } catch (e) {
      print("خطأ أثناء تحميل السورة: $e");
    }
  }

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
          backgroundColor: AppColor.lastColor,
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
            widget.sura.nameEN,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: size.height * 0.08),
            Text(
              widget.sura.nameAR,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Expanded(
              child: versesList.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(), // لو لسه بيحمل
              )
                  : ListView.builder(
                itemCount: versesList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8),
                    child: Text(
                      "${versesList[index].trim()} (${index + 1})",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
