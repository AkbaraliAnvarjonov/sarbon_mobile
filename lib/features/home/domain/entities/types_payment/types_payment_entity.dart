import 'package:equatable/equatable.dart';

import '../../../data/models/types_payment/types_payment_response.dart';

class TypesPaymentEntity extends Equatable {
  const TypesPaymentEntity({
    required this.data,
  });

  final List<TypePaymentListEntity> data;

  @override
  List<Object?> get props => [data];
}

class TypePaymentListEntity extends Equatable {
  const TypePaymentListEntity({
    required this.guid,
    required this.paymentType,
  });

  final String guid;
  final String paymentType;

  @override
  List<Object?> get props => [guid, paymentType];
}

extension TypesPaymentEntityX on TypesPaymentResponse {
  TypesPaymentEntity toEntity() => TypesPaymentEntity(
        data: data?.data?.response
                ?.map(
                  (address) => TypePaymentListEntity(
                    guid: address.guid ?? '',
                    paymentType: address.paymentType ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
