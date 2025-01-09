class SendCodeResponseModel {
  String? status;
  String? description;
  Data? data;

  SendCodeResponseModel({
    this.status,
    this.description,
    this.data,
  });

  SendCodeResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? smsId;
  bool? googleAccess;
  bool? userFound;

  Data({
    this.smsId,
    this.googleAccess,
    this.userFound,
  });

  Data.fromJson(Map<String, dynamic> json) {
    smsId = json['sms_id'];
    googleAccess = json['google_acces'];
    userFound = json['user_found'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sms_id'] = smsId;
    data['google_acces'] = googleAccess;
    data['user_found'] = userFound;
    return data;
  }
}
