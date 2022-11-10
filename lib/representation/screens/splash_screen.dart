import 'package:flutter/cupertino.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

// define router of screen
  static String routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // use Stack() to stack blocks
    return Stack(
      children: [
        // Positioned.fill FillAll space of screen
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.backgroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.circleSplash),
        ),
      ],
    );
  }
}
