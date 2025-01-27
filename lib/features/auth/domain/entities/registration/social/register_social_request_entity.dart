import '../../../../data/models/registration/driver/register_social_model.dart';

class RegisterSocialRequestEntity {
  String? displayName;
  String? loginType;
  String? idToken;
  String? accessToken;
  String type;
  String registerType;
  String uniqueId;

  RegisterSocialRequestEntity({
    this.displayName,
    this.loginType,
    this.idToken,
    this.accessToken,
    required this.type,
    required this.registerType,
    required this.uniqueId,
  });

  RegisterSocialRequestEntity copyWith({
    String? displayName,
    String? loginType,
    String? idToken,
    String? accessToken,
    String? type,
    String? registerType,
    String? uniqueId,
  }) =>
      RegisterSocialRequestEntity(
        displayName: displayName ?? this.displayName,
        loginType: loginType ?? this.loginType,
        idToken: idToken ?? this.idToken,
        accessToken: accessToken ?? this.accessToken,
        type: type ?? this.type,
        registerType: registerType ?? this.registerType,
        uniqueId: uniqueId ?? this.uniqueId,
      );
}

extension RegisterSocialRequestEntityX on RegisterSocialRequestEntity {
  RegisterSocialRequestModel get toModel => RegisterSocialRequestModel(
        displayName: displayName,
        loginType: loginType,
        idToken: idToken,
        accessToken: accessToken,
        type: type,
        registerType: registerType,
        uniqueId: uniqueId,
      );
}
