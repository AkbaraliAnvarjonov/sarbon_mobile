import 'package:sarbon_mobile/router/app_routes.dart';

class PutOppositeOfferRequestModel {
  OppositeOfferRequestData? data;

  PutOppositeOfferRequestModel({this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OppositeOfferRequestData {
  String cargoId;
  String usersId;
  String vehicleId;
  String usersId2;
  String carType;
  String firmId2;
  String currencyId;
  double offers;
  double prepayment;
  String comment;
  String firmId;
  List<String> paymentType;

  OppositeOfferRequestData({
    required this.cargoId,
    required this.usersId,
    required this.firmId2,
    required this.carType,
    required this.vehicleId,
    required this.usersId2,
    required this.currencyId,
    required this.offers,
    required this.prepayment,
    required this.comment,
    required this.paymentType,
    required this.firmId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cargo_id'] = cargoId;
    data['users_id'] = usersId;
    data['firm_id_2'] = firmId2;
    data['vehicle_id'] = vehicleId;
    data['car_type'] = carType;
    data['users_id_2'] = usersId2;
    data['currency_id'] = currencyId;
    data['offers'] = offers;
    data['prepayment'] = prepayment;
    data['comment'] = comment;
    data['payment_type'] = paymentType;
    data['firm_id'] = firmId;
    if (localSource.dispatcherId.isNotEmpty) {
      data['users_id_3'] = localSource.dispatcherId;
    }
    data['provisions'] = ['new', 'approve_by_customer'];
    return data;
  }
}
