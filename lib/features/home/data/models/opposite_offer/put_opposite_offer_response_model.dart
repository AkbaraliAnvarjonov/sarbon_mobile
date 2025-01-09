class PutOppositeOfferResponseModel {
  String? status;
  String? description;
  Data? data;
  String? customMessage;

  PutOppositeOfferResponseModel({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  PutOppositeOfferResponseModel.fromJson(Map<String, dynamic> json) {
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
  OppositeOfferResponseData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null
        ? OppositeOfferResponseData.fromJson(json['data'])
        : null;
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

class OppositeOfferResponseData {
  num? conditions;
  num? dimLengthSpecial;
  String? driverComment;
  String? guid;
  String? id;

  // List<String>? permissions;
  // List<String>? requirements;
  String? vehicleTypeIdNaN;

  OppositeOfferResponseData({
    this.conditions,
    this.dimLengthSpecial,
    this.driverComment,
    this.guid,
    this.id,
    // this.permissions,
    // this.requirements,
    this.vehicleTypeIdNaN,
  });

  OppositeOfferResponseData.fromJson(Map<String, dynamic> json) {
    conditions = json['conditions'];
    dimLengthSpecial = json['dim_length_special'];
    driverComment = json['driver_comment'];
    guid = json['guid'];
    id = json['id'];
    // permissions = json['permissions'].cast<String>();
    // requirements = json['requirements'].cast<String>();
    vehicleTypeIdNaN = json['vehicle_type_id_NaN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conditions'] = conditions;
    data['dim_length_special'] = dimLengthSpecial;
    data['driver_comment'] = driverComment;
    data['guid'] = guid;
    data['id'] = id;
    // data['permissions'] = permissions;
    // data['requirements'] = requirements;
    data['vehicle_type_id_NaN'] = vehicleTypeIdNaN;
    return data;
  }
}
