class CreateRouteRequest {
  CreateRouteRequest({
    this.data,
  });

  // CreateRouteRequest.fromJson(Map json) {
  //   data = json['data'] != null ? CreateRouteData.fromJson(json['data']) : null;
  // }

  CreateRouteData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class CreateRouteData {
  CreateRouteData({
    this.usersId,
    this.capacity,
    this.volume,
    this.date,
    this.vehicleId,
    this.from,
    this.to,
    this.shortNameFrom,
    this.shortNameTo,
    this.latFrom,
    this.lngFrom,
    this.latTo,
    this.lngTo,

    // this.shortName,
    // this.cityId,
    // this.cityId2,
    // this.addressId,
    // this.addressId2,
  });

  // CreateRouteData.fromJson(Map json) {
  //   usersId = json['users_id'];
  //
  //   capacity = json['capacity'];
  //   volume = json['volume'];
  //   date = json['date'];
  //   vehicleId = json['vehicle_id'];
  //   // shortName = json['short_name'];
  //   // cityId = json['city_id'];
  //   // cityId2 = json['city_id_2'];
  //   // addressId = json['address_id'];
  //   // addressId2 = json['address_id_2'];
  // }

  String? usersId;

  num? capacity;
  num? volume;
  String? date;
  String? vehicleId;
  String? from;
  String? to;
  String? shortNameFrom;
  String? shortNameTo;
  double? latFrom;
  double? lngFrom;
  double? latTo;
  double? lngTo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['address_id'] = addressId;
    // map['address_id_2'] = addressId2;
    // map['short_name'] = shortName;
    // map['city_id'] = cityId;
    // map['city_id_2'] = cityId2;
    map['users_id'] = usersId;
    map['capacity'] = capacity;
    map['volume'] = volume;
    map['date'] = date;
    map['vehicle_id'] = vehicleId;
    map['from'] = from;
    map['to'] = to;
    map['lat_from'] = latFrom;
    map['long_from'] = lngFrom;
    map['lat_to'] = latTo;
    map['long_to'] = lngTo;
    map['short_name_from'] = shortNameFrom;
    map['short_name_to'] = shortNameTo;

    return map;
  }
}
