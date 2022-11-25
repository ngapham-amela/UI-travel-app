import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/color_constants.dart';
import 'package:travel_app_flutter/core/helpers/local_storage_helper.dart';
import 'package:travel_app_flutter/representation/screens/splash_screen.dart';
import 'package:travel_app_flutter/routers.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        backgroundColor: ColorPalette.backgroundScaffoldGold,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldGold,
      ),
      home: const SplashScreen(),
      routes: router,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
