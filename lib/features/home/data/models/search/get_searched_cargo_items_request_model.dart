class GetSearchedCargoItemsRequestModel {
  List<String>? addressId;
  List<String>? addressId2;
  bool? withRelations;
  LoadTime? loadTime;
  List<String>? orderStatus;
  List<String>? cargoType;

  GetSearchedCargoItemsRequestModel({
    this.withRelations = true,
    this.addressId,
    this.addressId2,
    this.loadTime,
    this.orderStatus,
    this.cargoType,
  });

  GetSearchedCargoItemsRequestModel.fromJson(Map<String, dynamic> json) {
    withRelations = json['with_relations'];
    addressId = json['address_id'];
    addressId2 = json['address_id_2'];
    loadTime =
        json['load_time'] != null ? LoadTime.fromJson(json['load_time']) : null;
    // ignore: avoid_dynamic_calls
    orderStatus = json['order_status']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['with_relations'] = withRelations;
    data['city_id'] = addressId;
    if (addressId2 != null && addressId2!.first.isNotEmpty) {
      data['city_id_2'] = addressId2;
    }
    if (loadTime?.gte != null) {
      data['load_time'] = loadTime!.toJson();
    }
    data['order_status'] = orderStatus;
    data['cargo_type'] = ['cargo'];
    return data;
  }
}

class LoadTime {
  String? gte;
  String? lt;

  LoadTime({
    this.gte,
    this.lt,
  });

  LoadTime.fromJson(Map<String, dynamic> json) {
    gte = json[r'$gte'];
    lt = json[r'$lt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[r'$gte'] = gte;
    data[r'$lt'] = lt;
    return data;
  }
}
