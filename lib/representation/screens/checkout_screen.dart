// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/color_constants.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/constants/textstyle_ext.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';

import 'package:travel_app_flutter/data/models/room_model.dart';
import 'package:travel_app_flutter/representation/screens/main_app.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';
import 'package:travel_app_flutter/representation/widgets/item_room_book_widget.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    Key? key,
    required this.roomModel,
  }) : super(key: key);
  static const String routeName = '/checkout_screen';
  final RoomModel roomModel;

  List<String> listStep = [
    'Book and review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemCheckout(
      int step, String nameStep, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(
          nameStep,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  Widget _buildItemOptionCheckout(
    String icon,
    String item,
    String value,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(icon),
              SizedBox(
                width: kItemPadding,
              ),
              Text(
                item,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPalette.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Checkout Screen',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: listStep
                  .map(
                    (e) => _buildItemCheckout(
                      listStep.indexOf(e) + 1,
                      e,
                      listStep.indexOf(e) == listStep.length - 1,
                      listStep.indexOf(e) == 0,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomBookWidget(
              roomModel: roomModel,
              numberOfRoom: 1,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            _buildItemOptionCheckout(
              AssetHelper.iconContact,
              'Contact Details',
              'Add Contact',
              context,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            _buildItemOptionCheckout(
              AssetHelper.iconCode,
              'Promo Code',
              'Add Promo Code',
              context,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            ItemButtonWidget(
              data: 'PayMent',
              onTap: () {
                Navigator.of(context).popUntil(
                    (route) => route.settings.name == MainApp.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
