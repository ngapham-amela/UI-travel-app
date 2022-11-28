import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/data/models/room_model.dart';
import 'package:travel_app_flutter/representation/screens/checkout_screen.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:travel_app_flutter/representation/widgets/item_room_book_widget.dart';

class SelectRoomHotelScreen extends StatefulWidget {
  const SelectRoomHotelScreen({super.key});
  static const String routeName = '/select_room_hotel_screen';
  @override
  State<SelectRoomHotelScreen> createState() => _SelectRoomHotelScreenState();
}

class _SelectRoomHotelScreenState extends State<SelectRoomHotelScreen> {
  final List<RoomModel> roomModel = [
    RoomModel(
      roomName: 'Deluxe Room',
      roomSize: 27,
      roomImage: AssetHelper.room1,
      roomPrice: 245,
      roomUtility: 'Free Cancellation',
    ),
    RoomModel(
      roomName: 'Executive Suite',
      roomSize: 25,
      roomImage: AssetHelper.room2,
      roomPrice: 350,
      roomUtility: 'Free Cancellation',
    ),
    RoomModel(
      roomName: 'Deluxe Room',
      roomSize: 35,
      roomImage: AssetHelper.room3,
      roomPrice: 300,
      roomUtility: 'Free Cancellation',
    ),
    RoomModel(
      roomName: 'Executive Suite',
      roomSize: 30,
      roomImage: AssetHelper.room1,
      roomPrice: 200,
      roomUtility: 'Free Cancellation',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
          children: roomModel
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(bottom: kMediumPadding),
                  child: ItemRoomBookWidget(
                    roomModel: e,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CheckoutScreen.routeName, arguments: e);
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
