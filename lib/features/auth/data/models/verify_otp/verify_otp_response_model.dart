class VerifyOtpResponseModel {
  String? status;
  String? description;
  String? data;

  VerifyOtpResponseModel({
    this.status,
    this.description,
    this.data,
  });

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    data['data'] = this.data;
    return data;
  }
}
