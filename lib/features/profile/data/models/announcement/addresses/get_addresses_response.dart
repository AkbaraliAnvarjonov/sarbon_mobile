class GetAddressesResponse {
  GetAddressesResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  GetAddressesResponse.fromJson(Map json) {
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
        response?.add(AddressesListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<AddressesListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AddressesListResponse {
  AddressesListResponse({
    this.addressId,
    this.addressIdData,
    this.city,
    this.guid,
    this.name,
  });

  AddressesListResponse.fromJson(Map json) {
    addressId = json['address_id'];
    addressIdData = json['address_id_data'] != null
        ? AddressIdData.fromJson(json['address_id_data'])
        : null;
    city = json['city'];
    guid = json['guid'];
    name = json['name'];
  }

  String? addressId;
  AddressIdData? addressIdData;
  String? city;
  String? guid;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = addressId;
    if (addressIdData != null) {
      map['address_id_data'] = addressIdData?.toJson();
    }
    map['city'] = city;
    map['guid'] = guid;
    map['name'] = name;
    return map;
  }
}

class AddressIdData {
  AddressIdData({
    this.v,
    this.id,
    this.cargoIds,
    this.code,
    this.guid,
    this.logistikasendaninvitationtoorderDisable,
    this.name,
    this.responseIds,
    this.type,
  });

  AddressIdData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    cargoIds =
    json['cargo_ids'] != null ? json['cargo_ids'].cast<String>() : [];
    code = json['code'];
    guid = json['guid'];
    logistikasendaninvitationtoorderDisable =
    json['logistika-send-an-invitation-to-order_disable'];
    name = json['name'];
    responseIds =
    json['response_ids'] != null ? json['response_ids'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  List<String>? responseIds;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['cargo_ids'] = cargoIds;
    map['code'] = code;
    map['guid'] = guid;
    map['logistika-send-an-invitation-to-order_disable'] =
        logistikasendaninvitationtoorderDisable;
    map['name'] = name;
    map['response_ids'] = responseIds;
    map['type'] = type;
    return map;
  }
}