class RegisterDriverResponseModel {
  String? status;
  String? description;
  Data? data;

  RegisterDriverResponseModel({
    this.status,
    this.description,
    this.data,
  });

  RegisterDriverResponseModel.fromJson(Map<String, dynamic> json) {
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
  bool? userFound;
  String? userId;
  Role? role;
  Token? token;
  String? loginTableSlug;
  User? user;

  Data({
    this.userFound,
    this.userId,
    this.role,
    this.token,
    this.loginTableSlug,
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json) {
    userFound = json['user_found'];
    userId = json['user_id'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    loginTableSlug = json['login_table_slug'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_found'] = userFound;
    data['user_id'] = userId;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (token != null) {
      data['token'] = token!.toJson();
    }
    data['login_table_slug'] = loginTableSlug;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Role {
  String? id;
  String? clientTypeId;
  String? name;

  Role({
    this.id,
    this.clientTypeId,
    this.name,
  });

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_type_id'] = clientTypeId;
    data['name'] = name;
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;

  Token({this.accessToken, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class User {
  String? id;
  String? login;
  String? password;
  String? email;
  String? phone;
  String? companyId;

  User({
    this.id,
    this.login,
    this.password,
    this.email,
    this.phone,
    this.companyId,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['password'];
    email = json['email'];
    phone = json['phone'];
    companyId = json['company_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['login'] = login;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;
    data['company_id'] = companyId;
    return data;
  }
}
