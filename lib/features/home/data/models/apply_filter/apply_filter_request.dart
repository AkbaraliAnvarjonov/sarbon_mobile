// ignore_for_file: use_if_null_to_convert_nulls_to_bools

class ApplyFilterRequest {
  ApplyFilterRequest({
    this.cargoTypeId,
    this.mapId,
    this.weight,
    this.weight2,
    this.volumeM3,
    this.volumeM32,
    this.takeAllUnloads,
    this.withRelations,
    this.loadAroundTheClock,
    this.orderStatus,
    this.cityId,
    this.cityId2,
  });

  ApplyFilterRequest.fromJson(Map json) {
    cargoTypeId = json['vehicle_type_id'];
    mapId = json['map_id'];
    weight = json['weight'];
    volumeM3 = json['volume_m3'];
    takeAllUnloads = json['take_all_unloads'];
    loadAroundTheClock = json['load_around_the_clock'];
    withRelations = json['with_relations'];
    orderStatus = json['order_status']?.cast<String>();
    cityId = json['city_id'];
    cityId2 = json['city_id_2'];
  }

  String? cargoTypeId;
  String? mapId;
  num? weight;
  num? weight2;
  num? volumeM3;
  num? volumeM32;
  bool? takeAllUnloads;
  bool? loadAroundTheClock;
  bool? withRelations;
  List<String>? orderStatus;
  String? cityId;
  String? cityId2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cargoTypeId != null) {
      map['vehicle_type_id'] = cargoTypeId;
    }
    if (mapId != null) {
      map['map_id'] = mapId;
    }
    if (weight != null) {
      map['min_weight'] = weight;
    }

    if (weight2 != null) {
      map['max_weight'] = weight2;
    }
    if (volumeM3 != null) {
      map['min_volume'] = volumeM3;
    }
    if (volumeM32 != null) {
      map['max_volume'] = volumeM32;
    }
    if (takeAllUnloads != null && takeAllUnloads == true) {
      map['take_all_unloads'] = takeAllUnloads;
    }
    if (loadAroundTheClock != null && loadAroundTheClock == true) {
      map['load_around_the_clock'] = loadAroundTheClock;
    }
    if (cityId != null) {
      map['from'] = cityId;
    }
    if (cityId2 != null) {
      map['to'] = cityId2;
    }
    map['with_relations'] = withRelations;
    map['order_status'] = ['active'];
    return map;
  }
}
