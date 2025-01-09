import 'package:equatable/equatable.dart';

import '../../../data/models/send_code/send_code_request_model.dart';

class SendCodeRequestEntity extends Equatable {
  const SendCodeRequestEntity({
    this.phoneNumber,
    this.type,
    this.otp,
  });

  final String? type;
  final String? otp;
  final String? phoneNumber;

  @override
  List<Object?> get props => [phoneNumber, type, otp];
}

extension SendCodeRequestModelX on SendCodeRequestEntity {
  SendCodeRequestModel get toModel => SendCodeRequestModel(
        phoneNumber: phoneNumber,
        type: type,
        otp: otp,
      );
}
