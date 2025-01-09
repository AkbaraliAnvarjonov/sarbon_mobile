class RegisterDriverRequestModel {
  RegisterDriverInfoData? data;

  RegisterDriverRequestModel({this.data});

  RegisterDriverRequestModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? RegisterDriverInfoData.fromJson(json['data'])
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

class RegisterDriverInfoData {
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
  String? fcmToken;
  String? registerId;
  String? vehicleId;
  String? location;

  RegisterDriverInfoData({
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
    this.fcmToken,
    this.registerId,
    this.vehicleId,
    this.location,
  });

  RegisterDriverInfoData.fromJson(Map<String, dynamic> json) {
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
    fcmToken = json['fcm_token'];
    registerId = json['register_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['login'] = login;
    data['password'] = password;
    data['phone'] = phone;
    data['client_type_id'] = clientTypeId;
    data['role_id'] = roleId;
    // data['photo'] = photo;
    // data['passport_scan'] = passportScan;
    // data['passport_code'] = passportCode;
    // data['residence_registration'] = residenceRegistration;
    // data['driver_license'] = driverLicense;
    data['fcm_token'] = fcmToken;
    data['register_id'] = registerId;
    data['vehicle_type_id'] = vehicleId;
    data['last_location'] = location;
    data['type'] = 'phone';
    data['create_time'] = DateTime.now().toString();
    return data;
  }
}
