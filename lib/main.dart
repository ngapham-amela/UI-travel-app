import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/color_constants.dart';
import 'package:travel_app_flutter/representation/screens/splash_screen.dart';
import 'package:travel_app_flutter/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        backgroundColor: ColorPalette.backgroundScaffoldGold,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldGold,
      ),
      home: const SplashScreen(),
      routes: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
