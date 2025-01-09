class AddressModel {
  final String name;
  final double latitude;
  final double longitude;

  const AddressModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

class AddressDistanceTimeModel {
  final String distance;
  final String time;

  const AddressDistanceTimeModel({
    required this.distance,
    required this.time,
  });
}
