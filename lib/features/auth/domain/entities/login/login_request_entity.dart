import 'package:equatable/equatable.dart';

import '../../../data/models/login/login_request_model.dart';

class LoginRequestEntity extends Equatable {
  const LoginRequestEntity({
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

  final String? username;
  final String? password;
  final String? companyId;
  final String? projectId;
  final String? environmentId;
  final String? clientType;
  final List<String>? environmentIds;
  final String? fcmToken;
  final String? loginId;

  @override
  List<Object?> get props =>
      [
        username,
        password,
        companyId,
        projectId,
        environmentId,
        clientType,
        environmentIds,
        fcmToken,
        loginId,
  ];
}

extension LoginRequestModelX on LoginRequestEntity {
  LoginRequestModel get toModel =>
      LoginRequestModel(
        username: username,
        password: password,
        companyId: companyId,
        projectId: projectId,
        environmentId: environmentId,
        clientType: clientType,
        environmentIds: environmentIds,
        fcmToken: fcmToken,
        loginId: loginId,
      );
}
