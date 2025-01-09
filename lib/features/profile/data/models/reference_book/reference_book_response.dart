class ReferenceBookResponse {
  ReferenceBookResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  ReferenceBookResponse.fromJson(Map json) {
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
        response?.add(ReferenceBookListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<ReferenceBookListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ReferenceBookListResponse {
  ReferenceBookListResponse({
    this.answear,
    this.guid,
    this.question,
  });

  ReferenceBookListResponse.fromJson(Map json) {
    answear = json['answear'];
    guid = json['guid'];
    question = json['question'];
  }

  String? answear;
  String? guid;
  String? question;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answear'] = answear;
    map['guid'] = guid;
    map['question'] = question;
    return map;
  }
}
