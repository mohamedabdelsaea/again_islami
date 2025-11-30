import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:again_islami/moduels/layout/layout.dart';
import 'package:again_islami/moduels/on_boarding/on_boarding.dart';
import 'package:again_islami/moduels/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case PageRouteName.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        );
      case PageRouteName.layout:
        return MaterialPageRoute(
          builder: (context) => const Layout(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
