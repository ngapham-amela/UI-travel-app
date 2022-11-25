import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/constants/textstyle_ext.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';
import 'package:travel_app_flutter/data/models/hotel_model.dart';
import 'package:travel_app_flutter/representation/widgets/dashline_widget.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});

  static const String routeName = '/hotel_detail_screen';

  final HotelModel hotelModel;
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.hotelDetail1,
                fit: BoxFit.fill),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                ),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                  color: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.3,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding),
                      topRight: Radius.circular(kDefaultPadding),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(kItemPadding)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.hotelModel.hotelName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$${widget.hotelModel.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('/night'),
                              ],
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                  AssetHelper.iconLocateHotel,
                                ),
                                SizedBox(
                                  width: kMediumPadding,
                                ),
                                Text(
                                  widget.hotelModel.location,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                  AssetHelper.iconStarHotel,
                                ),
                                SizedBox(
                                  width: kMediumPadding,
                                ),
                                Text(
                                  '${widget.hotelModel.star.toString()}/5',
                                ),
                                Text(
                                  '(${widget.hotelModel.numberOfReview} reviews)',
                                  style:
                                      TextStyles.defaultStyle.subTitleTextColor,
                                ),
                                Spacer(),
                                Text(
                                  'See All',
                                  style: TextStyles.defaultStyle.bold,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Text(
                              'Information',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kMinPadding,
                            ),
                            Text(widget.hotelModel.hotelInfo),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: ImageHelper.loadFromAsset(
                                        AssetHelper.iconRestaurent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kMinPadding,
                                    ),
                                    Text('Restaurent'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: ImageHelper.loadFromAsset(
                                        AssetHelper.iconWifi,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kMinPadding,
                                    ),
                                    Text('Wifi'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: ImageHelper.loadFromAsset(
                                        AssetHelper.iconExchange,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kMinPadding,
                                    ),
                                    Text('Exchange'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: ImageHelper.loadFromAsset(
                                        AssetHelper.iconFontDesk,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kMinPadding,
                                    ),
                                    Text(
                                      'Front Desk',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: ImageHelper.loadFromAsset(
                                        AssetHelper.iconMore,
                                      ),
                                    ),
                                    SizedBox(
                                      height: kMinPadding,
                                    ),
                                    Text('More'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            Text(
                              'Location',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kMinPadding,
                            ),
                            Text(
                              widget.hotelModel.hotelLocationInfo.toString(),
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            ImageHelper.loadFromAsset(AssetHelper.map),
                            SizedBox(
                              height: kMediumPadding * 2,
                            ),
                            ItemButtonWidget(
                              data: 'Select Room',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
