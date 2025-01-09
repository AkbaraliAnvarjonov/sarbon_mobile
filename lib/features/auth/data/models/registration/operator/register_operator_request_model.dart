class RegisterOperatorRequestModel {
  RegisterOperatorInfoData? data;

  RegisterOperatorRequestModel({this.data});

  RegisterOperatorRequestModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? RegisterOperatorInfoData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegisterOperatorInfoData {
  String? fullName;
  String? firmId;
  String? login;
  String? password;
  String? email;
  String? phone;
  String? clientTypeId;
  String? roleId;
  String? photo;
  String? passportScan;
  String? passportCode;
  String? residenceRegistration;
  String? driverLicense;
  String? tin;
  String? iNn;
  int? index;
  String? punkt;
  String? road;
  String? house;
  String? fcmToken;
  String? registerId;

  RegisterOperatorInfoData({
    this.fullName,
    this.firmId,
    this.login,
    this.password,
    this.email,
    this.phone,
    this.clientTypeId,
    this.roleId,
    this.photo,
    this.passportScan,
    this.passportCode,
    this.residenceRegistration,
    this.driverLicense,
    this.tin,
    this.iNn,
    this.index,
    this.punkt,
    this.road,
    this.house,
    this.fcmToken,
    this.registerId,
  });

  RegisterOperatorInfoData.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    firmId = json['firm_id'];
    login = json['login'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    clientTypeId = json['client_type_id'];
    roleId = json['role_id'];
    photo = json['photo'];
    passportScan = json['passport_scan'];
    passportCode = json['passport_code'];
    residenceRegistration = json['residence_registration'];
    driverLicense = json['driver_license'];
    tin = json['tin'];
    iNn = json['i_nn'];
    index = json['index'];
    punkt = json['punkt'];
    road = json['road'];
    house = json['house'];
    fcmToken = json['fcm_token'];
    registerId = json['register_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['firm_id'] = firmId;
    data['login'] = login;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['client_type_id'] = clientTypeId;
    data['role_id'] = roleId;
    data['photo'] = photo;
    data['passport_scan'] = passportScan;
    data['passport_code'] = passportCode;
    data['residence_registration'] = residenceRegistration;
    data['driver_license'] = driverLicense;
    data['tin'] = tin;
    data['i_nn'] = iNn;
    data['index'] = index;
    data['punkt'] = punkt;
    data['road'] = road;
    data['house'] = house;
    data['fcm_token'] = fcmToken;
    data['register_id'] = registerId;
    return data;
  }
}
