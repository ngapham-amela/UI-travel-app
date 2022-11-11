import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/constants/textstyle_ext.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';
import 'package:travel_app_flutter/representation/screens/main_app.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const String routeName = '/intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buidItemIntroScreen(AlignmentGeometry alignment, String image,
      String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            image,
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              Text(description),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          // scrollDirection: Axis.vertical,
          controller: _pageController,
          children: [
            _buidItemIntroScreen(
              Alignment.centerRight,
              AssetHelper.intro1,
              'Book a flight',
              'Found a flight that matches your destination and schedule? Book it instantly.',
            ),
            _buidItemIntroScreen(
              Alignment.center,
              AssetHelper.intro2,
              'Find a hotel room',
              'Select the day, book your room. We give you the best price.',
            ),
            _buidItemIntroScreen(
              Alignment.centerLeft,
              AssetHelper.intro3,
              'Enjoy your trip',
              'Easy discovering new places and share these between your friends and travel together.',
            ),
          ],
        ),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ItemButtonWidget(
                        data: snapshot.data != 2 ? 'Next' : 'Get Started',
                        onTap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.of(context).pushNamed(MainApp.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ))
      ],
    ));
  }
}
