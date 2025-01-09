import 'package:equatable/equatable.dart';

import '../../../../data/models/registration/operator/register_operator_response_model.dart';

class RegisterOperatorResponseEntity extends Equatable {
  const RegisterOperatorResponseEntity({
    this.id,
    this.login,
    this.password,
    this.email,
    this.phone,
    this.companyId,
    this.accessToken,
    this.refreshToken,
  });

  final String? id;
  final String? login;
  final String? password;
  final String? email;
  final String? phone;
  final String? companyId;
  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object?> get props => [
        id,
        login,
        password,
        email,
        phone,
        companyId,
        accessToken,
        refreshToken,
      ];
}

extension RegisterOperatorResponseEntityX on RegisterOperatorResponseModel {
  RegisterOperatorResponseEntity toEntity() => RegisterOperatorResponseEntity(
        id: data?.userId ?? '',
        login: data?.user?.login ?? '',
        password: data?.user?.password ?? '',
        email: data?.user?.email ?? '',
        phone: data?.user?.phone ?? '',
        companyId: data?.user?.companyId ?? '',
        accessToken: data?.token?.accessToken ?? '',
        refreshToken: data?.token?.refreshToken ?? '',
      );
}
