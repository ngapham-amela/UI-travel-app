import 'package:flutter/material.dart';
import 'package:travel_app_flutter/core/helpers/asset_helper.dart';
import 'package:travel_app_flutter/data/models/hotel_model.dart';
import 'package:travel_app_flutter/representation/widgets/app_bar_container.dart';
import 'package:travel_app_flutter/representation/widgets/item_hotel_widget.dart';

class ListHotelScreen extends StatefulWidget {
  const ListHotelScreen({super.key});
  static const String routeName = '/list_hotel_screen';

  @override
  State<ListHotelScreen> createState() => _ListHotelScreenState();
}

class _ListHotelScreenState extends State<ListHotelScreen> {
  final List<HotelModel> hotelModel = [
    HotelModel(
        hotelName: 'Royal Palm Heritage',
        hotelImage: AssetHelper.hotel1,
        location: 'Purwokerto, Jateng',
        awayKilometer: '364',
        star: 4.5,
        numberOfReview: 3241,
        price: 143),
    HotelModel(
        hotelName: 'Grand Luxury’s',
        hotelImage: AssetHelper.hotel2,
        location: 'Banyumas, Jateng ',
        awayKilometer: '2.3',
        star: 4.2,
        numberOfReview: 2456,
        price: 234),
    HotelModel(
        hotelName: 'The Orlando House',
        hotelImage: AssetHelper.hotel3,
        location: 'Ajibarang, Jateng ',
        awayKilometer: '1.1',
        star: 3.5,
        numberOfReview: 1234,
        price: 132),
    HotelModel(
        hotelName: 'Grand Luxury’s',
        hotelImage: AssetHelper.hotel2,
        location: 'Banyumas, Jateng ',
        awayKilometer: '2.3',
        star: 4.2,
        numberOfReview: 2456,
        price: 234),
    HotelModel(
        hotelName: 'The Orlando House',
        hotelImage: AssetHelper.hotel3,
        location: 'Ajibarang, Jateng ',
        awayKilometer: '1.1',
        star: 3.5,
        numberOfReview: 1234,
        price: 132),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children:
              hotelModel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}
