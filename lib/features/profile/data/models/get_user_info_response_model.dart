class GetUserInfoResponseModel {
  String? status;
  String? description;
  Data? data;

  GetUserInfoResponseModel({
    this.status,
    this.description,
    this.data,
  });

  GetUserInfoResponseModel.fromJson(Map<String, dynamic> json) {
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
  UserInfoData? data;

  Data({this.tableSlug, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    data = json['data'] != null ? UserInfoData.fromJson(json['data']) : null;
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

class UserInfoData {
  int? count;
  List<UserInfo>? response;

  UserInfoData({this.count, this.response});

  UserInfoData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <UserInfo>[];
      json['response'].forEach((v) {
        response!.add(UserInfo.fromJson(v));
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

class UserInfo {
  String? birthdate;
  String? clientTypeId;
  String? companyId;
  String? driverLicense;
  String? email;
  String? fullName;
  String? guid;
  String? house;
  String? iNn;
  String? login;
  String? passportCode;
  String? passportIssuedBy;
  String? passportScan;
  String? password;
  bool? payment;
  String? phone;
  String? photo;
  String? punkt;
  String? residenceRegistration;
  String? road;
  String? roleId;
  String? tin;
  bool? verified;

  UserInfo({
    this.birthdate,
    this.clientTypeId,
    this.companyId,
    this.driverLicense,
    this.email,
    this.fullName,
    this.guid,
    this.house,
    this.iNn,
    this.login,
    this.passportCode,
    this.passportIssuedBy,
    this.passportScan,
    this.password,
    this.payment,
    this.phone,
    this.photo,
    this.punkt,
    this.residenceRegistration,
    this.road,
    this.roleId,
    this.tin,
    this.verified,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'];
    clientTypeId = json['client_type_id'];
    companyId = json['company_id'];
    driverLicense = json['driver_license'];
    email = json['email'];
    fullName = json['full_name'];
    guid = json['guid'];
    house = json['house'];
    iNn = json['i_nn'];
    login = json['login'];
    passportCode = json['passport_code'];
    passportIssuedBy = json['passport_issued_by'];
    passportScan = json['passport_scan'];
    password = json['password'];
    payment = json['payment'];
    phone = json['phone'];
    photo = json['photo'];
    punkt = json['punkt'];
    residenceRegistration = json['residence_registration'];
    road = json['road'];
    roleId = json['role_id'];
    tin = json['tin'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birthdate'] = birthdate;
    data['client_type_id'] = clientTypeId;
    data['company_id'] = companyId;
    data['driver_license'] = driverLicense;
    data['email'] = email;
    data['full_name'] = fullName;
    data['guid'] = guid;
    data['house'] = house;
    data['i_nn'] = iNn;
    data['login'] = login;
    data['passport_code'] = passportCode;
    data['passport_issued_by'] = passportIssuedBy;
    data['passport_scan'] = passportScan;
    data['password'] = password;
    data['payment'] = payment;
    data['phone'] = phone;
    data['photo'] = photo;
    data['punkt'] = punkt;
    data['residence_registration'] = residenceRegistration;
    data['road'] = road;
    data['role_id'] = roleId;
    data['tin'] = tin;
    data['verified'] = verified;
    return data;
  }
}
