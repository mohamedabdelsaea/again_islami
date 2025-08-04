import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:again_islami/moduels/layout/layout.dart';
import 'package:again_islami/moduels/layout/quran/sura_push.dart';
import 'package:again_islami/moduels/on_boarding/on_boarding.dart';
import 'package:again_islami/moduels/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case PageRouteName.onboarding:
        return MaterialPageRoute(
          builder: (context) => OnBoarding(),
        );
      case PageRouteName.layout:
        return MaterialPageRoute(
          builder: (context) => Layout(),
        );
        case PageRouteName.suraPush:
        return MaterialPageRoute(
          builder: (context) => SuraPush(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
