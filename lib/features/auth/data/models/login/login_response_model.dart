class LoginResponseModel {
  String? status;
  String? description;
  LoginData? data;

  LoginResponseModel({this.status, this.description, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
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

class LoginData {
  ClientPlatform? clientPlatform;
  ClientType? clientType;
  String? userId;
  Role? role;
  Token? token;
  List<Sessions>? sessions;
  String? loginTableSlug;
  String? resourceId;
  String? environmentId;
  User? user;
  GlobalPermission? globalPermission;
  UserData? userData;

  LoginData({
    this.clientPlatform,
    this.clientType,
    this.userId,
    this.role,
    this.token,
    this.sessions,
    this.loginTableSlug,
    this.resourceId,
    this.environmentId,
    this.user,
    this.globalPermission,
    this.userData,
  });

  LoginData.fromJson(Map<String, dynamic> json) {
    clientPlatform = json['client_platform'] != null ? ClientPlatform.fromJson(json['client_platform']) : null;
    clientType = json['client_type'] != null ? ClientType.fromJson(json['client_type']) : null;
    userId = json['user_id'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(Sessions.fromJson(v));
      });
    }
    loginTableSlug = json['login_table_slug'];
    resourceId = json['resource_id'];
    environmentId = json['environment_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    globalPermission = json['global_permission'] != null ? GlobalPermission.fromJson(json['global_permission']) : null;
    userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clientPlatform != null) {
      data['client_platform'] = clientPlatform!.toJson();
    }
    if (clientType != null) {
      data['client_type'] = clientType!.toJson();
    }
    data['user_id'] = userId;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (token != null) {
      data['token'] = token!.toJson();
    }
    if (sessions != null) {
      data['sessions'] = sessions!.map((v) => v.toJson()).toList();
    }
    data['login_table_slug'] = loginTableSlug;
    data['resource_id'] = resourceId;
    data['environment_id'] = environmentId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (globalPermission != null) {
      data['global_permission'] = globalPermission!.toJson();
    }
    return data;
  }
}

class ClientPlatform {
  String? id;
  String? projectId;
  String? name;
  String? subdomain;

  ClientPlatform({
    this.id,
    this.projectId,
    this.name,
    this.subdomain,
  });

  ClientPlatform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    name = json['name'];
    subdomain = json['subdomain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['name'] = name;
    data['subdomain'] = subdomain;
    return data;
  }
}

class ClientType {
  String? id;
  String? name;
  bool? selfRegister;
  bool? selfRecover;

  ClientType({
    this.id,
    this.name,
    this.selfRegister,
    this.selfRecover,
  });

  ClientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selfRegister = json['self_register'];
    selfRecover = json['self_recover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['self_register'] = selfRegister;
    data['self_recover'] = selfRecover;
    return data;
  }
}

class Role {
  String? id;
  String? clientTypeId;
  String? name;
  String? clientPlatformId;

  Role({
    this.id,
    this.clientTypeId,
    this.name,
    this.clientPlatformId,
  });

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    name = json['name'];
    clientPlatformId = json['client_platform_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_type_id'] = clientTypeId;
    data['name'] = name;
    data['client_platform_id'] = clientPlatformId;
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  int? refreshInSeconds;

  Token({
    this.accessToken,
    this.refreshToken,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.refreshInSeconds,
  });

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expires_at'] = expiresAt;
    data['refresh_in_seconds'] = refreshInSeconds;
    return data;
  }
}

class Sessions {
  String? id;
  String? projectId;
  String? clientTypeId;
  String? userId;
  String? roleId;
  String? ip;
  String? data;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;
  bool? isChanged;

  Sessions({
    this.id,
    this.projectId,
    this.clientTypeId,
    this.userId,
    this.roleId,
    this.ip,
    this.data,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.isChanged,
  });

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    clientTypeId = json['client_type_id'];
    userId = json['user_id'];
    roleId = json['role_id'];
    ip = json['ip'];
    data = json['data'];
    expiresAt = json['expires_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isChanged = json['is_changed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['client_type_id'] = clientTypeId;
    data['user_id'] = userId;
    data['role_id'] = roleId;
    data['ip'] = ip;
    data['data'] = this.data;
    data['expires_at'] = expiresAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_changed'] = isChanged;
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

class GlobalPermission {
  String? id;

  GlobalPermission({this.id});

  GlobalPermission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class UserData {
  UserData({
    this.v,
    this.id,
    this.adr,
    this.birthdate,
    this.cargoIds,
    this.clientTypeId,
    this.companyId,
    this.dailyContactNumberView,
    this.driverLicense,
    this.email,
    this.fullName,
    this.guid,
    this.house,
    this.iNn,
    this.index,
    this.login,
    this.notificationsIds,
    this.passportCode,
    this.passportIssuedBy,
    this.passportScan,
    this.password,
    this.payment,
    this.phone,
    this.photo,
    this.punkt,
    this.rating,
    this.residenceRegistration,
    this.road,
    this.roleId,
    this.tin,
    this.tr,
    this.track,
    this.typeDriver,
    this.verified,
    this.registerId,
    this.firmId,
  });

  UserData.fromJson(Map json) {
    v = json['__v'];
    id = json['_id'];
    // adr = json['adr'] != null ? json['adr'].cast<String>() : [];
    birthdate = json['birthdate'];
    cargoIds = json['cargo_ids'] != null && json['cargo_ids'] is List ? json['cargo_ids'].cast<String>() : [];
    clientTypeId = json['client_type_id'];
    companyId = json['company_id'];
    dailyContactNumberView = json['daily_contact_number_view'];
    driverLicense = json['driver_license'];
    email = json['email'];
    fullName = json['full_name'];
    firmId = json['firm_id'];
    guid = json['guid'];
    house = json['house'];
    iNn = json['i_nn'];
    index = json['index'];
    login = json['login'];
    if (json['notifications_ids'] != null) {
      notificationsIds = [];
      json['notifications_ids'].forEach((v) {
        notificationsIds?.add(v);
      });
    }
    passportCode = json['passport_code'];
    passportIssuedBy = json['passport_issued_by'];
    passportScan = json['passport_scan'];
    password = json['password'];
    payment = json['payment'];
    phone = json['phone'];
    photo = json['photo'];
    punkt = json['punkt'];
    rating = json['rating'];
    residenceRegistration = json['residence_registration'];
    road = json['road'];
    roleId = json['role_id'];
    tin = json['tin'];
    tr = json['tr'];
    track = json['track'];
    typeDriver = json['type_driver'];
    verified = json['verified'];
    registerId = json['register_id'];
    vehicleId = json['vehicle_type_id'];
  }

  num? v;
  dynamic id;
  List<String>? adr;
  String? birthdate;
  List<String>? cargoIds;
  String? clientTypeId;
  String? companyId;
  dynamic dailyContactNumberView;
  String? driverLicense;
  String? email;
  String? fullName;
  String? firmId;
  String? guid;
  String? house;
  String? iNn;
  dynamic index;
  String? login;
  List<dynamic>? notificationsIds;
  String? passportCode;
  String? passportIssuedBy;
  String? passportScan;
  String? password;
  bool? payment;
  String? phone;
  String? photo;
  String? punkt;
  num? rating;
  String? residenceRegistration;
  String? road;
  String? roleId;
  String? tin;
  dynamic tr;
  bool? track;
  String? typeDriver;
  bool? verified;
  String? registerId;
  String? vehicleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['__v'] = v;
    map['_id'] = id;
    map['adr'] = adr;
    map['birthdate'] = birthdate;
    map['cargo_ids'] = cargoIds;
    map['client_type_id'] = clientTypeId;
    map['company_id'] = companyId;
    map['daily_contact_number_view'] = dailyContactNumberView;
    map['driver_license'] = driverLicense;
    map['email'] = email;
    map['full_name'] = fullName;
    map['guid'] = guid;
    map['house'] = house;
    map['i_nn'] = iNn;
    map['index'] = index;
    map['firm_id'] = firmId;
    map['login'] = login;
    if (notificationsIds != null) {
      map['notifications_ids'] = notificationsIds?.map((v) => v.toJson()).toList();
    }
    map['passport_code'] = passportCode;
    map['passport_issued_by'] = passportIssuedBy;
    map['passport_scan'] = passportScan;
    map['password'] = password;
    map['payment'] = payment;
    map['phone'] = phone;
    map['photo'] = photo;
    map['punkt'] = punkt;
    map['rating'] = rating;
    map['residence_registration'] = residenceRegistration;
    map['road'] = road;
    map['role_id'] = roleId;
    map['tin'] = tin;
    map['tr'] = tr;
    map['track'] = track;
    map['type_driver'] = typeDriver;
    map['verified'] = verified;
    return map;
  }
}
