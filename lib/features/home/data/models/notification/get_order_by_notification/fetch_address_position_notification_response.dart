class FetchAddressPositionNotificationResponse {
  FetchAddressPositionNotificationResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  FetchAddressPositionNotificationResponse.fromJson(Map json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? MainData.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  String? status;
  String? description;
  MainData? data;
  String? customMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['description'] = description;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['custom_message'] = customMessage;
    return map;
  }
}

class MainData {
  MainData({
    this.tableSlug,
    this.data,
  });

  MainData.fromJson(Map json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? tableSlug;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_slug'] = tableSlug;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.count,
    this.response,
  });

  Data.fromJson(Map json) {
    count = json['count'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(AddressPositionResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<AddressPositionResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AddressPositionResponse {
  AddressPositionResponse({
    this.cargoId,
    this.guid,
    this.lat,
    this.long,
    this.name,
    this.responseId,
  });

  AddressPositionResponse.fromJson(Map json) {
    cargoId = json['cargo_id'];
    guid = json['guid'];
    lat = json['lat'];
    long = json['long'];
    name = json['name'];
    responseId = json['response_id'];
  }

  String? cargoId;
  String? guid;
  num? lat;
  num? long;
  String? name;
  String? responseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cargo_id'] = cargoId;
    map['guid'] = guid;
    map['lat'] = lat;
    map['long'] = long;
    map['name'] = name;
    map['response_id'] = responseId;
    return map;
  }
}
