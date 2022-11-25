class HotelModel {
  HotelModel(
      {required this.hotelName,
      required this.hotelImage,
      required this.location,
      required this.awayKilometer,
      required this.star,
      required this.numberOfReview,
      required this.price,
      required this.hotelInfo,
      this.hotelLocationInfo});

  final String hotelName;
  final String hotelImage;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final double price;
  final String hotelInfo;
  final String? hotelLocationInfo;
}
