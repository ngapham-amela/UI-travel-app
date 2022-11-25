import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  ItemUtilityHotelWidget({super.key});
  final List<Map<String, String>> listUtility = [
    {
      'icon': AssetHelper.iconWifiFree,
      'name': 'Free\nWifi',
    },
    {
      'icon': AssetHelper.iconRefund,
      'name': 'Non-\nRefundable',
    },
    {
      'icon': AssetHelper.iconBreafast,
      'name': 'Free\nBreakfast',
    },
    {
      'icon': AssetHelper.iconSmoking,
      'name': 'Non-\nSmoking',
    }
  ];

  Widget _buildItemUtilityHotel(String icon, String name) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        SizedBox(
          height: kMinPadding,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listUtility
              .map((e) => _buildItemUtilityHotel(e['icon']!, e['name']!))
              .toList()),
    );
  }
}
