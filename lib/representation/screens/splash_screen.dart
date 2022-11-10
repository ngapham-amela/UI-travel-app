import 'package:flutter/cupertino.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';
import 'package:travel_app_flutter/representation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

// define router of screen
  static String routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamed(IntroScreen.routeName);
  }

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
