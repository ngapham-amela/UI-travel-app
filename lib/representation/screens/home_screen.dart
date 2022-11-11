import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_flutter/core/constants/color_constants.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';
import 'package:travel_app_flutter/representation/screens/hotel_screen.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  Widget _buildItemCategory(
      Widget icon, Color Color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: kMediumPadding,
            ),
            decoration: BoxDecoration(
              color: Color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      // // title: Text('Home'),
      // titleString: 'Home',
      // implementLeading: true,
      // implementTraleing: true,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, James!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are you going next?',
                  style: TextStyle(
                    fontSize: 12,
                    // color: ColorPalette.subTitleColor,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  kItemPadding,
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kItemPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.person),
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(kItemPadding),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: kItemPadding,
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.iconHotel,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xffFE9C5E),
                  () {
                    Navigator.of(context).pushNamed(HotelScreen.routeName);
                  },
                  'Hotels',
                ),
              ),
              Expanded(
                child: _buildItemCategory(
                    ImageHelper.loadFromAsset(
                      AssetHelper.iconPlane,
                      width: kBottomBarIconSize,
                      height: kBottomBarIconSize,
                    ),
                    Color(0xffF77777),
                    () {},
                    'Flights,'),
              ),
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.iconHotelPlane,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xff3EC8BC),
                  () {},
                  'All',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
