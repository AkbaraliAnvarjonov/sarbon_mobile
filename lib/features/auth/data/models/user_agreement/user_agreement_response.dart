class UserAgreementResponse {
  UserAgreementResponse({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  UserAgreementResponse.fromJson(Map json) {
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
        response?.add(UserAgreementListResponse.fromJson(v));
      });
    }
  }

  num? count;
  List<UserAgreementListResponse>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserAgreementListResponse {
  UserAgreementListResponse({
    this.answear,
    this.email,
    this.globalDownloads,
    this.guid,
    this.location,
    this.phoneNumber,
    this.photo,
    this.projectsCompleted,
    this.question,
    this.returnOnInvestment,
    this.status,
  });

  UserAgreementListResponse.fromJson(Map json) {
    answear = json['answear'];
    email = json['email'];
    globalDownloads = json['global_downloads'];
    guid = json['guid'];
    location = json['location'];
    phoneNumber = json['phone_number'];
    photo = json['photo'];
    projectsCompleted = json['projects_completed'];
    question = json['question'];
    returnOnInvestment = json['return_on_investment'];
    status = json['status'] != null ? json['status'].cast<String>() : [];
  }

  String? answear;
  String? email;
  dynamic globalDownloads;
  String? guid;
  String? location;
  String? phoneNumber;
  String? photo;
  dynamic projectsCompleted;
  String? question;
  dynamic returnOnInvestment;
  List<String>? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answear'] = answear;
    map['email'] = email;
    map['global_downloads'] = globalDownloads;
    map['guid'] = guid;
    map['location'] = location;
    map['phone_number'] = phoneNumber;
    map['photo'] = photo;
    map['projects_completed'] = projectsCompleted;
    map['question'] = question;
    map['return_on_investment'] = returnOnInvestment;
    map['status'] = status;
    return map;
  }
}
