import 'package:equatable/equatable.dart';

import '../../../data/models/login/get_client_type_request_model.dart';

class GetClientTypeRequestEntity extends Equatable {
  const GetClientTypeRequestEntity({
    required this.password,
    required this.username,
  });

  final String? password;
  final String? username;

  @override
  List<Object?> get props => [username, password];
}

extension SignInRequestModelX on GetClientTypeRequestEntity {
  GetClientTypeRequestModel get toModel => GetClientTypeRequestModel(
        password: password,
        username: username,
      );
}
