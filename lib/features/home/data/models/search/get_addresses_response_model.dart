class GetAddressesResponseModel {
  String? status;
  String? description;
  Data? data;
  String? customMessage;

  GetAddressesResponseModel({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  GetAddressesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['custom_message'] = customMessage;
    return data;
  }
}

class Data {
  String? tableSlug;
  AddressesData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? AddressesData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddressesData {
  int? count;
  List<Address>? response;

  AddressesData({
    this.count,
    this.response,
  });

  AddressesData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <Address>[];
      json['response'].forEach((v) {
        response!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  Address({
    this.addressId,
    this.addressIdData,
    this.city,
    this.guid,
    this.name,
    this.nameEn,
    this.nameRu,
  });

  Address.fromJson(Map json) {
    addressId = json['address_id'];
    addressIdData = json['address_id_data'] != null
        ? AddressIdData.fromJson(json['address_id_data'])
        : null;
    city = json['city'];
    guid = json['guid'];
    name = json['name'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
  }

  String? addressId;
  AddressIdData? addressIdData;
  String? city;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = addressId;
    if (addressIdData != null) {
      map['address_id_data'] = addressIdData?.toJson();
    }
    map['city'] = city;
    map['guid'] = guid;
    map['name'] = name;
    map['name_ru'] = nameRu;
    map['name_en'] = nameEn;
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
    this.nameEn,
    this.nameRu,
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
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
    responseIds =
        json['response_ids'] != null ? json['response_ids'].cast<String>() : [];

    /// Shu joyi o'zgardi

    // type = json['type'] != null ? json['type'].cast<String>() : [];
  }

  num? v;
  dynamic id;
  List<String>? cargoIds;
  String? code;
  String? guid;
  bool? logistikasendaninvitationtoorderDisable;
  String? name;
  String? nameEn;
  String? nameRu;
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
    map['name_en'] = nameEn;
    map['name_ru'] = nameRu;
    map['response_ids'] = responseIds;
    map['type'] = type;
    return map;
  }
}
