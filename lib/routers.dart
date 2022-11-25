import 'package:flutter/material.dart';
import 'package:travel_app_flutter/data/models/hotel_model.dart';
import 'package:travel_app_flutter/representation/screens/guest_and_book_screen.dart';
import 'package:travel_app_flutter/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app_flutter/representation/screens/hotel_screen.dart';
import 'package:travel_app_flutter/representation/screens/intro_screen.dart';
import 'package:travel_app_flutter/representation/screens/list_hotel_screen.dart';
import 'package:travel_app_flutter/representation/screens/main_app.dart';
import 'package:travel_app_flutter/representation/screens/select_date_screen.dart';
import 'package:travel_app_flutter/representation/screens/select_room_hotel_screen.dart';
import 'package:travel_app_flutter/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> router = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: ((context) => const HotelScreen()),
  SelectDateScreen.routeName: ((context) => SelectDateScreen()),
  GuestAndRoomBookingScreen.routeName: ((context) =>
      GuestAndRoomBookingScreen()),
  ListHotelScreen.routeName: ((context) => ListHotelScreen()),
  // HotelDetailScreen.routeName: (context) => HotelDetailScreen(),
  SelectRoomHotelScreen.routeName: (context) => SelectRoomHotelScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HotelDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final HotelModel hotelModel = (settings.arguments as HotelModel);
          return HotelDetailScreen(
            hotelModel: hotelModel,
          );
        },
      );
  }
  return null;
}
