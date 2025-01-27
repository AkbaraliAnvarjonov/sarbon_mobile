part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class UsernameEvent extends LoginEvent {
  const UsernameEvent({required this.username});

  final String username;

  @override
  List<Object?> get props => [username];
}

class PasswordEvent extends LoginEvent {
  const PasswordEvent({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

class ChangePasswordVisibilityEvent extends LoginEvent {
  const ChangePasswordVisibilityEvent();

  @override
  List<Object?> get props => [];
}

class RegisterWithSocialEvent extends LoginEvent {
  const RegisterWithSocialEvent({
    required this.displayName,
    required this.loginType,
    required this.idToken,
    required this.accessToken,
    required this.registerType,
    required this.type,
    required this.uniqueId,
  });

  final String displayName;
  final String loginType;
  final String idToken;
  final String accessToken;
  final String type;
  final String registerType;
  final String uniqueId;

  @override
  List<Object> get props => [
        displayName,
        loginType,
        idToken,
        accessToken,
        registerType,
        type,
        uniqueId,
      ];
}
