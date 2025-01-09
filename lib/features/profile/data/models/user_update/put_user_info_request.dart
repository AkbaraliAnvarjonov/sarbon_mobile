class PutUserInfoRequest {
  PutUserInfoRequest({
    this.data,
  });

  PutUserInfoRequest.fromJson(Map json) {
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
    this.guid,
    this.photo,
    this.email,
    this.fullName,
    // this.phone,
    // this.login,
    this.password,
  });

  Data.fromJson(Map json) {
    guid = json['guid'];
    photo = json['photo'];
    email = json['email'];
    fullName = json['full_name'];
    // phone = json['phone'];
    // login = json['login'];
    password = json['password'];
  }

  String? guid;
  String? photo;
  String? email;
  String? fullName;
  // String? phone;
  // String? login;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = guid;
    map['photo'] = photo;
    map['email'] = email;
    map['full_name'] = fullName;
    // map['phone'] = phone;
    // map['login'] = login;
    map['password'] = password;
    return map;
  }
}
