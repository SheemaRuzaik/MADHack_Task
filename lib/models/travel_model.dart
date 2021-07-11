class TravelModel {
  final String image;
  final String destinationName;
  final String place;
  final String shortDescp;
  final String longDescp;

  TravelModel(
      {required this.image,
      required this.destinationName,
      required this.place,
      required this.shortDescp,
      required this.longDescp});

  factory TravelModel.fromJason(Map<String, dynamic> json) => TravelModel(
      image: json["Image"],
      destinationName: json["DestName"],
      place: json["Place"],
      shortDescp: json["ShortDescp"],
      longDescp: json["LongDescp"]);
}
