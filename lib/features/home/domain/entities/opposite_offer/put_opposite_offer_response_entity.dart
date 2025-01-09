import 'package:equatable/equatable.dart';

import '../../../data/models/opposite_offer/put_opposite_offer_response_model.dart';

class PutOppositeOfferResponseEntity extends Equatable {
  final num? conditions;
  final num? dimLengthSpecial;
  final String? driverComment;
  final String? guid;
  final String? id;
  final String? vehicleTypeIdNaN;

  // List<String>? permissions;
  // List<String>? requirements;

  const PutOppositeOfferResponseEntity({
    this.conditions,
    this.dimLengthSpecial,
    this.driverComment,
    this.guid,
    this.id,
    this.vehicleTypeIdNaN,
    // this.permissions,
    // this.requirements,
  });

  @override
  List<Object?> get props => [
        conditions,
        dimLengthSpecial,
        driverComment,
        guid,
        id,
        vehicleTypeIdNaN,
        // permissions,
        // requirements,
      ];
}

extension PutOppositeOfferResponseEntityX on PutOppositeOfferResponseModel {
  PutOppositeOfferResponseEntity toEntity() => PutOppositeOfferResponseEntity(
        conditions: data?.data?.conditions ?? 0,
        dimLengthSpecial: data?.data?.dimLengthSpecial ?? 0,
        driverComment: data?.data?.driverComment ?? '',
        guid: data?.data?.guid ?? '',
        id: data?.data?.id ?? '',
        vehicleTypeIdNaN: data?.data?.vehicleTypeIdNaN ?? '',
        // permissions: data?.data?.permissions ?? [],
        // requirements: data?.data?.requirements ?? [],
      );
}
