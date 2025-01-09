class PutFavouriteRequest {
  PutFavouriteRequest({
    this.data,
  });

  PutFavouriteRequest.fromJson(Map json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.guid,
    this.cargoIds,
  });

  Data.fromJson(Map json) {
    guid = json['guid'];
    cargoIds =
        // ignore: avoid_dynamic_calls
        json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
  }

  String? guid;
  List<String>? cargoIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['cargo_ids'] = cargoIds;
    return map;
  }
}
