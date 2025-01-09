class LoginRequestModel {
  String? username;
  String? password;
  String? companyId;
  String? projectId;
  String? environmentId;
  String? clientType;
  List<String>? environmentIds;
  String? fcmToken;
  String? loginId;

  LoginRequestModel({
    this.username,
    this.password,
    this.companyId,
    this.projectId,
    this.environmentId,
    this.clientType,
    this.environmentIds,
    this.fcmToken,
    this.loginId,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    companyId = json['company_id'];
    projectId = json['project_id'];
    environmentId = json['environment_id'];
    clientType = json['client_type_id'];
    environmentIds =
        environmentIds != null ? json['environment_ids'].cast<String>() : [];
    fcmToken = json['fcm_token'];
    loginId = json['login_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['company_id'] = companyId;
    data['project_id'] = projectId;
    data['environment_id'] = environmentId;
    data['client_type'] = clientType;
    data['environment_ids'] = environmentIds;
    data['fcm_token'] = fcmToken;
    data['login_id'] = loginId;
    return data;
  }
}
