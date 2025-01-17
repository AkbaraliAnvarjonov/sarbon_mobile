import '../../../../core/utils/utils.dart';

class GetLoadTypesResponseModel {
  String? status;
  String? description;
  Data? data;

  GetLoadTypesResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetLoadTypesResponseModel.fromJson(Map<String, dynamic> json) {
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
  LoadTypeData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? LoadTypeData.fromJson(json['data']) : null;
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

class LoadTypeData {
  int? count;
  List<LoadType>? response;

  LoadTypeData({this.count, this.response});

  LoadTypeData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <LoadType>[];
      json['response'].forEach((v) {
        response!.add(LoadType.fromJson(v));
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

class LoadType {
  String? guid;
  String? name;

  LoadType({
    this.guid,
    this.name,
  });

  LoadType.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = getLocalizedName(json, 'name');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guid'] = guid;
    data['name'] = name;
    return data;
  }
}
