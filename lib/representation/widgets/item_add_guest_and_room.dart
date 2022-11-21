import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/core/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom(
      {super.key,
      required this.title,
      required this.icon,
      required this.innitData});

  final String title;
  final String icon;
  final int innitData;

  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late TextEditingController _textEditionController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.innitData;
    _textEditionController =
        TextEditingController(text: widget.innitData.toString())
          ..addListener(() {
            number = int.parse(_textEditionController.text);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kMediumPadding),
      child: Row(children: [
        ImageHelper.loadFromAsset(
          widget.icon,
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        Text(
          widget.title,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              number++;
              _textEditionController.text = number.toString();
              if (_focusNode.hasFocus) {
                _focusNode.unfocus();
              }
            });
          },
          child: ImageHelper.loadFromAsset(
            AssetHelper.iconAsc,
          ),
        ),
        //
        Container(
          height: 50,
          width: 40,
          padding: EdgeInsets.only(left: 3),
          alignment: Alignment.center,
          child: TextField(
            controller: _textEditionController,
            textAlign: TextAlign.center,
            focusNode: _focusNode,
            enabled: true,
            autocorrect: false,
            minLines: 1,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(bottom: 18),
            ),
            onChanged: (value) {},
            onSubmitted: (String submitvalue) {},
          ),
        ),
        GestureDetector(
          onTap: () {
            if (number > 1) {
              setState(() {
                number--;
                _textEditionController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
              });
            }
          },
          child: ImageHelper.loadFromAsset(
            AssetHelper.iconDesc,
          ),
        ),
      ]),
    );
  }
}
