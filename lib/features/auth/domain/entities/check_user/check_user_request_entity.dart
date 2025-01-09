import 'package:equatable/equatable.dart';
import 'package:sarbon_mobile/features/auth/data/models/check_user/check_user_request_model.dart';

import '../../../data/models/send_code/send_code_request_model.dart';

class CheckUserRequestEntity extends Equatable {
  const CheckUserRequestEntity({
    this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

extension CheckUserRequestModelX on CheckUserRequestEntity {
  CheckUserRequestModel get toModel => CheckUserRequestModel(
        phoneNumber: phoneNumber,
      );
}
