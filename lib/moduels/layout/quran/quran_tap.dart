import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/moduels/layout/quran/sura_push.dart';
import 'package:again_islami/moduels/layout/quran/widget/quran_list.dart';
import 'package:flutter/material.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
            /// اللوجو
            SliverToBoxAdapter(
              child: Image.asset(
                'assets/images/Logo8.png',
                height: size.height * 0.2,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),

            /// مربع البحث
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15),
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
                    prefixIcon: const Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ImageIcon(
                        AssetImage('assets/icons/quran.png'),
                      ),
                    ),
                    fillColor: AppColor.whites.withOpacity(0.05),
                    filled: true,
                  ),
                  cursorColor: AppColor.primary,
                ),
              ),
            ),

            /// Most Recently
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Most Recently ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColor.primary),
                ),
              ),
            ),

            /// Horizontal List
            SliverToBoxAdapter(
              child: SizedBox(
                height: 155,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuraPush(

                                // suraName: "الأنبياء",
                                // suraIndex: index,
                              ),
                            ),
                          );
                        },
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Al-Anbiya',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('الأنبياء',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text('122 Verses',
                                      style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              const Spacer(),
                              Image.asset('assets/images/quran_search.png'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            /// Suras List Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Suras List ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColor.primary),
                ),
              ),
            ),

            /// Suras List
            SliverList.separated(
              itemCount: 114,
              separatorBuilder: (context, index) => Divider(
                indent: size.width * 0.1,
                endIndent: size.width * 0.1,
                thickness: 2,
                color: AppColor.primary,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuraPush(
                          // suraName: "سورة رقم ${index + 1}",
                          // suraIndex: index,
                        ),
                      ),
                    );
                  },
                  child: const QuranList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}