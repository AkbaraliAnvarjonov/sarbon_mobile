class VerifyOtpRequestModel {
  VerifyOtpRequestModel({
    this.data,
    this.loginStrategy,
  });

  VerifyOtpRequestModel.fromJson(Map json) {
    data = json['data'] != null ? VerifyRequestData.fromJson(json['data']) : null;
    loginStrategy = json['login_strategy'];
  }

  VerifyRequestData? data;
  String? loginStrategy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['login_strategy'] = loginStrategy;
    return map;
  }
}

class VerifyRequestData {
  VerifyRequestData({
    this.smsId,
    this.otp,
    this.phone,
    this.clientTypeId,
    this.roleId,
  });

  VerifyRequestData.fromJson(Map json) {
    smsId = json['sms_id'];
    otp = json['otp'];
    phone = json['phone'];
    clientTypeId = json['client_type_id'];
    roleId = json['role_id'];
  }

  String? smsId;
  String? otp;
  String? phone;
  String? clientTypeId;
  String? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sms_id'] = smsId;
    map['otp'] = otp;
    map['phone'] = phone;
    map['client_type_id'] = clientTypeId;
    map['role_id'] = roleId;
    return map;
  }
}
