class UpdateRouteRequest {
  UpdateRouteRequest({
    this.data,
  });

  UpdateRouteRequest.fromJson(Map json) {
    data = json['data'] != null ? UpdateRouteData.fromJson(json['data']) : null;
  }

  UpdateRouteData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class UpdateRouteData {
  UpdateRouteData({
    this.guid,
    this.usersId,
    this.addressId,
    this.addressId2,
    this.capacity,
    this.volume,
    this.date,
    this.vehicleId,
    this.shortName,
    this.cityId,
    this.cityId2,
  });

  UpdateRouteData.fromJson(Map json) {
    guid = json['guid'];
    usersId = json['users_id'];
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    capacity = json['capacity'];
    volume = json['volume'];
    date = json['date'];
    vehicleId = json['vehicle_id'];
    shortName = json['short_name'];
    cityId = json['city_id'];
    cityId2 = json['city_id_2'];
  }

  String? guid;
  String? usersId;
  String? addressId;
  String? addressId2;
  num? capacity;
  num? volume;
  String? date;
  String? vehicleId;
  String? shortName;
  String? cityId;
  String? cityId2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['users_id'] = usersId;
    map['address_id'] = addressId;
    map['address_id_2'] = addressId2;
    map['capacity'] = capacity;
    map['volume'] = volume;
    map['date'] = date;
    map['vehicle_id'] = vehicleId;
    map['short_name'] = shortName;
    map['city_id'] = cityId;
    map['city_id_2'] = cityId2;
    return map;
  }
}
