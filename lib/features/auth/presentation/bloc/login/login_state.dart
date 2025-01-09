part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = ApiStatus.initial,
    this.username,
    this.password,
    this.companyId,
    this.clientTypeId,
    this.isPasswordVisible = true,
  });

  final ApiStatus status;
  final String? username;
  final String? password;
  final String? companyId;
  final String? clientTypeId;
  final bool isPasswordVisible;

  @override
  List<Object?> get props => [
        status,
        username,
        password,
        companyId,
        clientTypeId,
        isPasswordVisible,
      ];

  LoginState copyWith({
    ApiStatus? status,
    String? username,
    String? password,
    String? companyId,
    String? clientTypeId,
    bool? isPasswordVisible,
  }) =>
      LoginState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        companyId: companyId ?? this.companyId,
        clientTypeId: clientTypeId ?? this.clientTypeId,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      );
}
