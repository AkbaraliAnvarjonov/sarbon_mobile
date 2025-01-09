import '../../../../data/models/registration/driver/register_driver_request_model.dart';

class RegisterDriverRequestEntity {
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
  String? fcmToken;
  String? registerId;
  String? vehicleId;
  String? location;

  RegisterDriverRequestEntity({
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
    this.fcmToken,
    this.registerId,
    this.vehicleId,
    this.location,
  });

  RegisterDriverRequestEntity copyWith({
    String? fcmToken,
    String? registerId,
    String? location,
  }) =>
      RegisterDriverRequestEntity(
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
        vehicleId: vehicleId,
        location: location ?? this.location,
        fcmToken: fcmToken ?? this.fcmToken,
        registerId: registerId ?? this.registerId,
      );
}

extension RegisterDriverRequestEntityX on RegisterDriverRequestEntity {
  RegisterDriverRequestModel get toModel => RegisterDriverRequestModel(
        data: RegisterDriverInfoData(
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
          fcmToken: fcmToken,
          registerId: registerId,
          vehicleId: vehicleId,
          location: location,
        ),
      );
}
