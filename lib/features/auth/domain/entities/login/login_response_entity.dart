import 'package:equatable/equatable.dart';

import '../../../data/models/login/login_response_model.dart';

class LoginResponseEntity extends Equatable {
  const LoginResponseEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.login,
    required this.password,
    required this.email,
    required this.phone,
    required this.companyId,
    required this.fullName,
    this.cargoIds = const [],
    required this.imageUrl,
    required this.registerId,
    required this.firmId,
    required this.vehicleId,
  });

  final String accessToken;
  final String refreshToken;
  final String userId;
  final String login;
  final String password;
  final String email;
  final String phone;
  final String companyId;
  final String fullName;
  final String firmId;
  final List<String> cargoIds;
  final String imageUrl;
  final String registerId;
  final String vehicleId;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        userId,
        login,
        password,
        email,
        phone,
        firmId,
        companyId,
        fullName,
        cargoIds,
        imageUrl,
        registerId,
      ];
}

extension LoginResponseEntityX on LoginResponseModel {
  LoginResponseEntity toEntity() => LoginResponseEntity(
        accessToken: data?.token?.accessToken ?? '',
        refreshToken: data?.token?.refreshToken ?? '',
        userId: data?.userData?.guid ?? '',
        login: data?.user?.login ?? '',
        password: data?.user?.password ?? '',
        email: data?.user?.email ?? '',
        phone: data?.userData?.phone ?? '',
        companyId: data?.user?.companyId ?? '',
        fullName: data?.userData?.fullName ?? '',
        firmId: data?.userData?.firmId ?? '',
        cargoIds: data?.userData?.cargoIds ?? [],
        imageUrl: data?.userData?.photo ?? '',
        registerId: data?.userData?.registerId ?? '',
        vehicleId: data?.userData?.vehicleId ?? '',
      );
}
