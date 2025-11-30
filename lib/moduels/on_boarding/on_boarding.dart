import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:again_islami/core/theme/app_color.dart';
import 'package:again_islami/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<List<String>> pages = [
    ["assets/images/Logo55.png", "assets/images/intro_1 (2).png"],
    ["assets/images/Logo55.png", "assets/images/intro_2.png"],
    ["assets/images/Logo55.png", "assets/images/intro_3.png"],
    ["assets/images/Logo55.png", "assets/images/intro_4.png"],
    ["assets/images/Logo55.png", "assets/images/intro_5.png"],
  ];

  Future<void> _finishOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_seen", true);

    if (!mounted) return;
    navigatorKey.currentState!.pushReplacementNamed(PageRouteName.layout);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.lastColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (String img in pages[index])
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              img,
                              height: size.height * 0.35,
                              width: size.width * 0.7,
                              fit: BoxFit.contain,
                            ),
                          ),
                        const SizedBox(height: 30),
                        if (index == pages.length - 1)
                          ElevatedButton(
                            onPressed: _finishOnBoarding,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              backgroundColor: AppColor.primary,
                            ),
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                color: AppColor.lastColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColor.primary,
                    dotColor: Colors.grey.shade400,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 6,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _finishOnBoarding,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
