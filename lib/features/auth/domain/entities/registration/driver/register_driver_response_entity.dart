import 'package:equatable/equatable.dart';

import '../../../../data/models/registration/driver/register_driver_response_model.dart';

class RegisterDriverResponseEntity extends Equatable {
  const RegisterDriverResponseEntity({
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

extension RegisterDriverResponseEntityX on RegisterDriverResponseModel {
  RegisterDriverResponseEntity toEntity() => RegisterDriverResponseEntity(
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
