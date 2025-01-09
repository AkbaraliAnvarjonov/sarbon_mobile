import 'package:equatable/equatable.dart';

import '../../../data/models/send_code/send_code_response_model.dart';

class SendCodeResponseEntity extends Equatable {
  const SendCodeResponseEntity({
    required this.smsId,
  });

  final String smsId;

  @override
  List<Object?> get props => [smsId];
}

extension SendCodeResponseEntityX on SendCodeResponseModel {
  SendCodeResponseEntity toEntity() => SendCodeResponseEntity(
        smsId: data?.smsId ?? '',
      );
}
