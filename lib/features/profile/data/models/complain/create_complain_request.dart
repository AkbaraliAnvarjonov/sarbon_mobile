class CreateComplainRequest {
  CreateComplainRequest({
    this.data,
  });

  CreateComplainRequest.fromJson(Map json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.usersId,
    this.phone,
    this.text,
  });

  Data.fromJson(Map json) {
    usersId = json['users_id'];
    phone = json['phone'];
    text = json['text'];
  }

  String? usersId;
  String? phone;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users_id'] = usersId;
    map['phone'] = phone;
    map['text'] = text;
    return map;
  }
}
