class GetVehicleTypesResponseModel {
  String? status;
  String? description;
  Data? data;

  GetVehicleTypesResponseModel({this.status, this.description, this.data});

  GetVehicleTypesResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? tableSlug;
  VehicleTypesData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data =
        json['data'] != null ? VehicleTypesData.fromJson(json['data']) : null;
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

class VehicleTypesData {
  int? count;
  List<VehicleTypeItem>? response;

  VehicleTypesData({this.count, this.response});

  VehicleTypesData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <VehicleTypeItem>[];
      json['response'].forEach((v) {
        response!.add(VehicleTypeItem.fromJson(v));
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

class VehicleTypeItem {
  String? guid;
  BrandIdData? brandIdData;
  TrailerTypeIdData? trailerTypeIdData;
  String? carNumber;

  VehicleTypeItem({
    this.guid,
    this.brandIdData,
    this.trailerTypeIdData,
    this.carNumber,
  });

  VehicleTypeItem.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    brandIdData = json['brand_id_data'] != null
        ? BrandIdData.fromJson(json['brand_id_data'])
        : null;
    trailerTypeIdData = json['trailer_type_id_data'] != null
        ? TrailerTypeIdData.fromJson(json['trailer_type_id_data'])
        : null;
    carNumber = json['car_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    if (brandIdData != null) {
      data['brand_id_data'] = brandIdData!.toJson();
    }
    if (trailerTypeIdData != null) {
      data['trailer_type_id_data'] = trailerTypeIdData!.toJson();
    }
    data['car_number'] = carNumber;
    return data;
  }
}

class TrailerTypeIdData {
  String? guid;
  String? name;

  TrailerTypeIdData({this.guid, this.name});

  TrailerTypeIdData.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['name'] = name;
    return data;
  }
}

class BrandIdData {
  String? guid;
  String? shortName;

  BrandIdData({this.guid, this.shortName});

  BrandIdData.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    shortName = json['short_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['short_name'] = shortName;
    return data;
  }
}
