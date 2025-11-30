import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/provider/setting_provider.dart';
import 'package:again_islami/moduels/layout/quran/sura_push.dart';
import 'package:again_islami/moduels/layout/quran/widget/quran_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final suraList = Provider.of<SettingProvider>(context).suraData;


    final filteredList = suraList.where((sura) {
      final query = searchQuery.toLowerCase();
      return sura.nameEN.toLowerCase().contains(query) ||
          sura.nameAR.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/q.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/Logo8.png',
                height: size.height * 0.2,
                width: size.width,
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
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
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ImageIcon(
                        AssetImage('assets/icons/quran.png'),
                      ),
                    ),
                    fillColor: AppColor.whites.withAlpha(50),
                    filled: true,
                  ),
                  cursorColor: AppColor.primary,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Suras List ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList.separated(
                itemCount: filteredList.length,
                separatorBuilder: (context, index) => Divider(
                  indent: size.width * 0.1,
                  endIndent: size.width * 0.1,
                  thickness: 2,
                  color: AppColor.primary,
                ),
                itemBuilder: (context, index) {
                  final sura = filteredList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuraPush(sura: sura),
                        ),
                      );
                    },
                    child: QuranList(sura: sura),
                  );
                },
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 10)),
          ],
        ),
      ),
    );
  }
}
