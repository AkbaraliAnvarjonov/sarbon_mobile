class RegisterSocialRequestModel {
  String? displayName;
  String? loginType;
  String? idToken;
  String? accessToken;
  String type;
  String registerType;
  String uniqueId;

  RegisterSocialRequestModel({
    this.displayName,
    this.loginType,
    this.idToken,
    this.accessToken,
    required this.type,
    required this.registerType,
    required this.uniqueId,
  });

  Map<String, dynamic> toJson() => {
        'display_name': displayName,
        'login_type': loginType,
        'id_token': idToken,
        'access_token': accessToken,
        'type': type,
        'register_type': registerType,
        'unique_id': uniqueId,
      };
}
