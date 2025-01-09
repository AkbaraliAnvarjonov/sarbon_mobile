class PostSignedRequest {
  num lat;
  num long;
  String usersId;
  String currentTime;
  String orderId;
  String gpsTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    map['users_id'] = usersId;
    map['current_time'] = currentTime;
    map['gps_time'] = gpsTime;
    map['order_id'] = orderId;
    return map;
  }

  PostSignedRequest({
    required this.lat,
    required this.long,
    required this.usersId,
    required this.currentTime,
    required this.gpsTime,
    required this.orderId,
  });
}
