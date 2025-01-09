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