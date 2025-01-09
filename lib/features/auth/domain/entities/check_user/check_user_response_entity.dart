import 'package:equatable/equatable.dart';
import 'package:sarbon_mobile/features/auth/data/models/check_user/check_user_response_model.dart';

class CheckUserResponseEntity extends Equatable {
  const CheckUserResponseEntity({
    required this.users,
  });

  final List<dynamic> users;

  @override
  List<Object?> get props => [users];
}

extension CheckUserResponseEntityX on CheckUserResponseModel {
  CheckUserResponseEntity toEntity() => CheckUserResponseEntity(
        users: data?.users ?? [],
      );
}
