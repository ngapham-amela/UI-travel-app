import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/constants/textstyle_ext.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';
import 'package:travel_app_flutter/data/models/room_model.dart';
import 'package:travel_app_flutter/representation/widgets/dashline_widget.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';
import 'package:travel_app_flutter/representation/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookWidget extends StatelessWidget {
  const ItemRoomBookWidget({
    Key? key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kItemPadding),
      ),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.roomName,
                    style: TextStyles.defaultStyle.fontHeader.bold,
                  ),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text('Room Size: ${roomModel.roomSize} m2'),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text(roomModel.roomUtility),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ImageHelper.loadFromAsset(
                roomModel.roomImage,
                radius: BorderRadius.all(
                  Radius.circular(kMinPadding),
                ),
              ),
            ),
          ],
        ),
        ItemUtilityHotelWidget(),
        DashLineWidget(),
        SizedBox(
          height: kMinPadding,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${roomModel.roomPrice}',
                    style: TextStyles.defaultStyle.bold,
                  ),
                  Text(
                    '/night',
                    style: TextStyles.defaultStyle.fontCaption,
                  ),
                ],
              ),
            ),
            Expanded(
              child: numberOfRoom == null
                  ? ItemButtonWidget(
                      data: 'Choose',
                      onTap: onTap,
                    )
                  : Text(
                      '$numberOfRoom room',
                      textAlign: TextAlign.end,
                    ),
            )
          ],
        ),
      ]),
    );
  }
}
