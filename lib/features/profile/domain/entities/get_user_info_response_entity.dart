import 'package:equatable/equatable.dart';

import '../../data/models/get_user_info_response_model.dart';

class GetUserInfoResponseEntity extends Equatable {
  const GetUserInfoResponseEntity({
    this.birthdate,
    this.clientTypeId,
    this.companyId,
    this.driverLicense,
    this.email,
    this.fullName,
    this.guid,
    this.house,
    this.iNn,
    this.login,
    this.passportCode,
    this.passportIssuedBy,
    this.passportScan,
    this.password,
    this.payment,
    this.phone,
    this.photo,
    this.punkt,
    this.residenceRegistration,
    this.road,
    this.roleId,
    this.tin,
    this.verified,
  });

  final String? birthdate;
  final String? clientTypeId;
  final String? companyId;
  final String? driverLicense;
  final String? email;
  final String? fullName;
  final String? guid;
  final String? house;
  final String? iNn;
  final String? login;
  final String? passportCode;
  final String? passportIssuedBy;
  final String? passportScan;
  final String? password;
  final bool? payment;
  final String? phone;
  final String? photo;
  final String? punkt;
  final String? residenceRegistration;
  final String? road;
  final String? roleId;
  final String? tin;
  final bool? verified;

  @override
  List<Object?> get props => [
        birthdate,
        clientTypeId,
        companyId,
        driverLicense,
        email,
        fullName,
        guid,
        house,
        iNn,
        login,
        passportCode,
        passportIssuedBy,
        passportScan,
        password,
        payment,
        phone,
        photo,
        punkt,
        residenceRegistration,
        road,
        roleId,
        tin,
        verified,
      ];
}

extension GetUserInfoResponseEntityX on GetUserInfoResponseModel {
  GetUserInfoResponseEntity toEntity() =>
      data?.data?.response?.isNotEmpty ?? false
          ? GetUserInfoResponseEntity(
              birthdate: data?.data?.response?.first.birthdate ?? '',
              clientTypeId: data?.data?.response?.first.clientTypeId ?? '',
              companyId: data?.data?.response?.first.companyId ?? '',
              driverLicense: data?.data?.response?.first.driverLicense ?? '',
              email: data?.data?.response?.first.email ?? '',
              fullName: data?.data?.response?.first.fullName ?? '',
              guid: data?.data?.response?.first.guid ?? '',
              house: data?.data?.response?.first.house ?? '',
              iNn: data?.data?.response?.first.iNn ?? '',
              login: data?.data?.response?.first.login ?? '',
              passportCode: data?.data?.response?.first.passportCode ?? '',
              passportIssuedBy:
                  data?.data?.response?.first.passportIssuedBy ?? '',
              passportScan: data?.data?.response?.first.passportScan ?? '',
              password: data?.data?.response?.first.password ?? '',
              payment: data?.data?.response?.first.payment ?? false,
              phone: data?.data?.response?.first.phone ?? '',
              photo: data?.data?.response?.first.photo ?? '',
              punkt: data?.data?.response?.first.punkt ?? '',
              residenceRegistration:
                  data?.data?.response?.first.residenceRegistration ?? '',
              road: data?.data?.response?.first.road ?? '',
              roleId: data?.data?.response?.first.roleId ?? '',
              tin: data?.data?.response?.first.tin ?? '',
              verified: data?.data?.response?.first.verified ?? false,
            )
          : const GetUserInfoResponseEntity();
}
