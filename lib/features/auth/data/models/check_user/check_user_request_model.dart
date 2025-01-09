import 'dart:convert';

class CheckUserRequestModel {
  const CheckUserRequestModel({
    this.phoneNumber,
  });

  factory CheckUserRequestModel.fromJson(Map json) => CheckUserRequestModel(
        phoneNumber: json['recipient'],
      );

  final String? phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search'] = phoneNumber;
    map['offset'] = 0;
    map['limit'] = 1000;
    map['view_fields'] = ['phone'];
    map['order'] = {};
    return {'data': jsonEncode(map)};
  }
}
