import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_flutter/representation/widgets/item_add_guest_and_room.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static const String routeName = '/guest_and_room_screen';
  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add guest and room',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 3,
          ),
          ItemAddGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.iconGuest,
            innitData: 2,
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemAddGuestAndRoom(
            title: 'Room',
            icon: AssetHelper.iconRoom1,
            innitData: 1,
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemButtonWidget(
            data: 'Select',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemButtonWidget(
            data: 'cancel',
            onTap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
