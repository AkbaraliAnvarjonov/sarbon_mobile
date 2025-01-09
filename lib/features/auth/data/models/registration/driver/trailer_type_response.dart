class TrailerTypeResponse {
  final String guid;
  final String name;
  final String vehicleDetailType;

  TrailerTypeResponse({
    required this.guid,
    required this.name,
    required this.vehicleDetailType,
  });

  factory TrailerTypeResponse.fromJson(Map<String, dynamic> json) => TrailerTypeResponse(
        guid: json['guid'] ?? '',
        name: json['name'] ?? '',
        vehicleDetailType: json['vehicle_detail_type'] ?? '',
      );
}
