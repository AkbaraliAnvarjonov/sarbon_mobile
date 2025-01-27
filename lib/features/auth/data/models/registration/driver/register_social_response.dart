import 'package:equatable/equatable.dart';

class RegisterSocialResponseEntity extends Equatable {
  const RegisterSocialResponseEntity({
    this.clientTypeId,
    this.companyServiceEnvironmentId,
    this.companyServiceProjectId,
    this.email,
    this.fullName,
    this.guid,
    this.login,
    this.password,
    this.phone,
    this.provisions,
    this.roleId,
    this.track,
    this.userStatus,
    this.yourId,
    this.tableSlug,
    this.users,
  });

  final String? clientTypeId;
  final String? companyServiceEnvironmentId;
  final String? companyServiceProjectId;
  final String? email;
  final String? fullName;
  final String? guid;
  final String? login;
  final String? password;
  final String? phone;
  final List<String>? provisions;
  final String? roleId;
  final bool? track;
  final List<String>? userStatus;
  final String? yourId;
  final String? tableSlug;
  final List<User>? users;

  @override
  List<Object?> get props => [
        clientTypeId,
        companyServiceEnvironmentId,
        companyServiceProjectId,
        email,
        fullName,
        guid,
        login,
        password,
        phone,
        provisions,
        roleId,
        track,
        userStatus,
        yourId,
        tableSlug,
        users,
      ];
}

class RegisterSocialResponseModel {
  String? status;
  String? description;
  DataWrapper? data;
  String? customMessage;

  RegisterSocialResponseModel({
    this.status,
    this.description,
    this.data,
    this.customMessage,
  });

  RegisterSocialResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? DataWrapper.fromJson(json['data']) : null;
    customMessage = json['custom_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['custom_message'] = customMessage;
    return data;
  }
}

class DataWrapper {
  String? status;
  DataContent? data;
  String? tableSlug;
  String? attributes;
  String? serverError;

  DataWrapper({
    this.status,
    this.data,
    this.tableSlug,
    this.attributes,
    this.serverError,
  });

  DataWrapper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataContent.fromJson(json['data']) : null;
    tableSlug = json['table_slug'];
    attributes = json['attributes'];
    serverError = json['server_error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['table_slug'] = tableSlug;
    data['attributes'] = attributes;
    data['server_error'] = serverError;
    return data;
  }
}

class DataContent {
  String? clientTypeId;
  String? companyServiceEnvironmentId;
  String? companyServiceProjectId;
  String? email;
  String? fullName;
  String? guid;
  String? login;
  String? password;
  String? phone;
  List<String>? provisions;
  String? roleId;
  bool? track;
  List<String>? userStatus;
  String? yourId;
  List<User>? response;

  DataContent({
    this.clientTypeId,
    this.companyServiceEnvironmentId,
    this.companyServiceProjectId,
    this.email,
    this.fullName,
    this.guid,
    this.login,
    this.password,
    this.phone,
    this.provisions,
    this.roleId,
    this.track,
    this.userStatus,
    this.yourId,
    this.response,
  });

  DataContent.fromJson(Map<String, dynamic> json) {
    // Handle deeply nested structure for single user type
    final nestedData = json['data']?['data'];
    if (nestedData is Map) {
      clientTypeId = nestedData['client_type_id'];
      companyServiceEnvironmentId = nestedData['company_service_environment_id'];
      companyServiceProjectId = nestedData['company_service_project_id'];
      email = nestedData['email'];
      fullName = nestedData['full_name'];
      guid = nestedData['guid'];
      login = nestedData['login'];
      password = nestedData['password'];
      phone = nestedData['phone'];
      provisions = nestedData['provisions']?.cast<String>();
      roleId = nestedData['role_id'];
      track = nestedData['track'];
      userStatus = nestedData['user_status']?.cast<String>();
      yourId = nestedData['your_id'];
    }

    // Handle list of users type
    if (json['response'] != null) {
      response = (json['response'] as List).map((user) => User.fromJson(user)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_type_id'] = clientTypeId;
    data['company_service_environment_id'] = companyServiceEnvironmentId;
    data['company_service_project_id'] = companyServiceProjectId;
    data['email'] = email;
    data['full_name'] = fullName;
    data['guid'] = guid;
    data['login'] = login;
    data['password'] = password;
    data['phone'] = phone;
    data['provisions'] = provisions;
    data['role_id'] = roleId;
    data['track'] = track;
    data['user_status'] = userStatus;
    data['your_id'] = yourId;
    if (response != null) {
      data['response'] = response!.map((user) => user.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? email;
  String? fullName;
  String? guid;
  String? login;
  String? phone;

  User({
    this.email,
    this.fullName,
    this.guid,
    this.login,
    this.phone,
  });

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    fullName = json['full_name'];
    guid = json['guid'];
    login = json['login'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['full_name'] = fullName;
    data['guid'] = guid;
    data['login'] = login;
    data['phone'] = phone;
    return data;
  }
}
