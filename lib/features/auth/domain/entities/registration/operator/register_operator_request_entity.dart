import '../../../../data/models/registration/operator/register_operator_request_model.dart';

class RegisterOperatorRequestEntity {
  String? fullName;
  String? companyId;
  String? login;
  String? password;
  String? email;
  String? phone;
  String? clientTypeId;
  String? roleId;
  String? photo;
  String? passportScan;
  String? passportCode;
  String? residenceRegistration;
  String? driverLicense;
  String? tin;
  String? iNn;
  int? index;
  String? punkt;
  String? road;
  String? house;
  String? fcmToken;
  String? registerId;

  RegisterOperatorRequestEntity({
    this.fullName,
    this.companyId,
    this.login,
    this.password,
    this.email,
    this.phone,
    this.clientTypeId,
    this.roleId,
    this.photo,
    this.passportScan,
    this.passportCode,
    this.residenceRegistration,
    this.driverLicense,
    this.tin,
    this.iNn,
    this.index,
    this.punkt,
    this.road,
    this.house,
    this.fcmToken,
    this.registerId,
  });

  RegisterOperatorRequestEntity copyWith({
    String? fcmToken,
    String? registerId,
  }) =>
      RegisterOperatorRequestEntity(
        fullName: fullName,
        companyId: companyId,
        login: login,
        password: password,
        email: email,
        phone: phone,
        clientTypeId: clientTypeId,
        roleId: roleId,
        photo: photo,
        passportScan: passportScan,
        passportCode: passportCode,
        residenceRegistration: residenceRegistration,
        driverLicense: driverLicense,
        tin: tin,
        iNn: iNn,
        index: index,
        punkt: punkt,
        road: road,
        house: house,
        fcmToken: fcmToken ?? this.fcmToken,
        registerId: registerId ?? this.registerId,
      );
}

extension RegisterOperatorRequestEntityX on RegisterOperatorRequestEntity {
  RegisterOperatorRequestModel get toModel => RegisterOperatorRequestModel(
        data: RegisterOperatorInfoData(
          fullName: fullName,
          firmId: companyId,
          login: login,
          password: password,
          email: email,
          phone: phone,
          clientTypeId: clientTypeId,
          roleId: roleId,
          photo: photo,
          passportScan: passportScan,
          passportCode: passportCode,
          residenceRegistration: residenceRegistration,
          driverLicense: driverLicense,
          tin: tin,
          iNn: iNn,
          index: index,
          punkt: punkt,
          road: road,
          house: house,
          fcmToken: fcmToken,
          registerId: registerId,
        ),
      );
}
