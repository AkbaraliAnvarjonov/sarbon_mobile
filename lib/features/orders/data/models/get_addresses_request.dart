class GetAddressesRequest {
  GetAddressesRequest({
    this.data,
  });

  GetAddressesRequest.fromJson(Map json) {
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
    this.objectIds,
  });

  Data.fromJson(Map json) {
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
