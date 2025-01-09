class SendCodeRequestModel {
  const SendCodeRequestModel({
    this.phoneNumber,
    this.type,
    this.otp,
  });

  factory SendCodeRequestModel.fromJson(Map json) => SendCodeRequestModel(
        phoneNumber: json['recipient'],
        type: json['type'],
        otp: json['text'],
      );

  final String? type;
  final String? otp;
  final String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['recipient'] = phoneNumber;
    map['type'] = type;
    map['text'] = otp;
    return map;
  }
}
