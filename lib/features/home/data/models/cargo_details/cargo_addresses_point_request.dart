class CargoPointsAddressesRequest {
  CargoPointsAddressesRequest({
    this.data,
  });

  CargoPointsAddressesRequest.fromJson(Map json) {
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
  }

  MainData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class MainData {
  MainData({
    this.objectIds,
  });

  MainData.fromJson(Map json) {
    objectIds =
        json['object_ids'] != null ? json['object_ids'].cast<String>() : [];
  }

  List<String>? objectIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['object_ids'] = objectIds;
    return map;
  }
}
