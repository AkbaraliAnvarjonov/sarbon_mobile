import 'package:equatable/equatable.dart';

import '../../../data/models/user_agreement/user_agreement_response.dart';

class UserAgreementEntity extends Equatable {
  const UserAgreementEntity({
    this.response,
  });

  final List<ResponseListEntity>? response;

  @override
  List<Object?> get props => [
        response,
      ];
}

class ResponseListEntity extends Equatable {
  const ResponseListEntity({
    this.answer,
  });

  final String? answer;

  @override
  List<Object?> get props => [
        answer,
      ];
}

extension UserAgreementEntityX on UserAgreementResponse {
  UserAgreementEntity toEntity() => UserAgreementEntity(
        response: data?.data?.response
                ?.map(
                  (response) => ResponseListEntity(
                    answer: response.answear ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
