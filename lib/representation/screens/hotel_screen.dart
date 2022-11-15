import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/constants/dismension_constants.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/representation/screens/select_date_screen.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:travel_app_flutter/representation/widgets/item_booking_widget.dart';
import 'package:travel_app_flutter/representation/widgets/item_button_widget.dart';
import 'package:travel_app_flutter/core/extensions/date_ext.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});
  static const String routeName = '/hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  String? dateSelect;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotel booking',
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemBookingWidget(
            icon: AssetHelper.iconLocate,
            title: 'Destination',
            description: 'South Korea',
            onTap: () {},
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemBookingWidget(
            icon: AssetHelper.iconDate,
            title: 'Select Date',
            description: dateSelect ?? '13 Feb - 18 Feb 2021',
            onTap: () async {
              final result = await Navigator.of(context)
                  .pushNamed(SelectDateScreen.routeName);
              if (!(result as List<DateTime?>)
                  .any((element) => element == null)) {
                dateSelect =
                    '${result[0]?.getStartDate}-${result[1]?.getEndDate}';
                setState(() {});
              }
            },
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemBookingWidget(
            icon: AssetHelper.iconRoom,
            title: 'Guest and Room',
            description: '2 Guest, 1 Room',
            onTap: () {},
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ItemButtonWidget(
            data: 'Search',
            onTap: (() {}),
          )
        ]),
      ),
    );
  }
}
