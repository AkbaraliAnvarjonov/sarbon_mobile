class GetCargoTypesResponseModel {
  String? status;
  String? description;
  Data? data;

  GetCargoTypesResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetCargoTypesResponseModel.fromJson(Map<String, dynamic> json) {
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
  CargoTypesData? data;

  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? CargoTypesData.fromJson(json['data']) : null;
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

class CargoTypesData {
  int? count;
  List<CargoType>? response;

  CargoTypesData({
    this.count,
    this.response,
  });

  CargoTypesData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <CargoType>[];
      json['response'].forEach((v) {
        response!.add(CargoType.fromJson(v));
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

class CargoType {
  String? guid;
  String? name;

  CargoType({this.guid, this.name});

  CargoType.fromJson(Map<String, dynamic> json) {
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
