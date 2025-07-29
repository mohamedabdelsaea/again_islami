import 'package:again_islami/core/routes/app_routes.dart';
import 'package:again_islami/core/routes/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: PageRouteName.layout,
    );
  }
}
