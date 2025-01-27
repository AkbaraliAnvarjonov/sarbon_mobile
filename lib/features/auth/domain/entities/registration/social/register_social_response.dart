import 'package:equatable/equatable.dart';

import '../../../../data/models/registration/driver/register_social_response.dart';

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
      ];
}

extension RegisterSocialResponseEntityX on RegisterSocialResponseModel {
  RegisterSocialResponseEntity toEntity() => RegisterSocialResponseEntity(
        clientTypeId: data?.data?.clientTypeId,
        companyServiceEnvironmentId: data?.data?.companyServiceEnvironmentId,
        companyServiceProjectId: data?.data?.companyServiceProjectId,
        email: data?.data?.email ?? data?.data?.response?.firstOrNull?.email ?? '',
        fullName: data?.data?.fullName ?? data?.data?.response?.firstOrNull?.fullName ?? '',
        guid: data?.data?.guid ?? data?.data?.response?.firstOrNull?.guid ?? '',
        login: data?.data?.login ?? data?.data?.response?.firstOrNull?.login ?? '',
        password: data?.data?.password ?? data?.data?.response?.firstOrNull?.guid ?? '',
        phone: data?.data?.phone ?? data?.data?.response?.firstOrNull?.phone ?? '',
        provisions: data?.data?.provisions,
        roleId: data?.data?.roleId,
        track: data?.data?.track,
        userStatus: data?.data?.userStatus,
        yourId: data?.data?.yourId,
        tableSlug: data?.tableSlug,
      );
}
