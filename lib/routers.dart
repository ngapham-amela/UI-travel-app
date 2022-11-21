import 'package:flutter/material.dart';
import 'package:travel_app_flutter/representation/screens/hotel_screen.dart';
import 'package:travel_app_flutter/representation/screens/intro_screen.dart';
import 'package:travel_app_flutter/representation/screens/main_app.dart';
import 'package:travel_app_flutter/representation/screens/select_date_screen.dart';
import 'package:travel_app_flutter/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> router = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: ((context) => const HotelScreen()),
  SelectDateScreen.routeName: ((context) => SelectDateScreen()),
};
