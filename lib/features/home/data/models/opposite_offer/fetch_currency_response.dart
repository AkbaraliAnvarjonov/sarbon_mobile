class FetchCurrencyResponse {
  FetchCurrencyResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  FetchCurrencyResponse.fromJson(Map json) {
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
        response?.add(CurrencyResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<CurrencyResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CurrencyResponse {
  CurrencyResponse({
    this.code,
    this.guid,
    this.name,
    this.photo,
    this.shortName,
  });

  CurrencyResponse.fromJson(Map json) {
    code = json['code'];
    guid = json['guid'];
    name = json['name'];
    photo = json['photo'];
    shortName = json['short_name'];
  }

  String? code;
  String? guid;
  String? name;
  String? photo;
  String? shortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['guid'] = guid;
    map['name'] = name;
    map['photo'] = photo;
    map['short_name'] = shortName;
    return map;
  }
}
