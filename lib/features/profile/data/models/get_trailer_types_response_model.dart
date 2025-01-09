class GetTrailerTypesResponseModel {
  String? status;
  String? description;
  Data? data;

  GetTrailerTypesResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetTrailerTypesResponseModel.fromJson(Map<String, dynamic> json) {
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
  TrailerTypeData? data;

  Data({
    this.tableSlug,
    this.data,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? TrailerTypeData.fromJson(json['data']) : null;
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

class TrailerTypeData {
  int? count;
  List<TrailerType>? response;

  TrailerTypeData({
    this.count,
    this.response,
  });

  TrailerTypeData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <TrailerType>[];
      json['response'].forEach((v) {
        response!.add(TrailerType.fromJson(v));
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

class TrailerType {
  String? guid;
  String? name;

  TrailerType({this.guid, this.name});

  TrailerType.fromJson(Map<String, dynamic> json) {
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
