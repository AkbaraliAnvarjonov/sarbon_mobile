part of 'opposite_offer_bloc.dart';

abstract class OppositeOfferEvent extends Equatable {
  const OppositeOfferEvent();
}

class GetVehicleTypesEvent extends OppositeOfferEvent {
  const GetVehicleTypesEvent();

  @override
  List<Object?> get props => [];
}

class SelectVehicleTypesEvent extends OppositeOfferEvent {
  const SelectVehicleTypesEvent({
    required this.vehicleType,
  });

  final VehicleTypeItemEntity? vehicleType;

  @override
  List<Object?> get props => [vehicleType];
}

class WritePrepaymentPercentageEvent extends OppositeOfferEvent {
  const WritePrepaymentPercentageEvent({
    required this.percentage,
  });

  final String? percentage;

  @override
  List<Object?> get props => [percentage];
}

class WritePrepaymentAmountEvent extends OppositeOfferEvent {
  const WritePrepaymentAmountEvent({
    required this.amount,
  });

  final String? amount;

  @override
  List<Object?> get props => [amount];
}

class WriteAfterCompletionPercentageEvent extends OppositeOfferEvent {
  const WriteAfterCompletionPercentageEvent({
    required this.percentage,
  });

  final String? percentage;

  @override
  List<Object?> get props => [percentage];
}

class WriteAfterCompletionAmountEvent extends OppositeOfferEvent {
  const WriteAfterCompletionAmountEvent({
    required this.amount,
  });

  final String? amount;

  @override
  List<Object?> get props => [amount];
}

class GetPrepaymentTabIndexEvent extends OppositeOfferEvent {
  const GetPrepaymentTabIndexEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}

class GetPayAfterCompletionTabIndexEvent extends OppositeOfferEvent {
  const GetPayAfterCompletionTabIndexEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [index];
}

class ButtonPressedEvent extends OppositeOfferEvent {
  const ButtonPressedEvent({
    required this.guid,
    required this.driverComment,
    required this.selectedVehicleId,
    required this.selectedVehicleName,
    required this.prepaymentAmount,
    required this.driverCash,
    required this.firmId,
    required this.userId2,
  });

  final String guid;
  final String driverComment;
  final String firmId;
  final String selectedVehicleId;
  final String selectedVehicleName;
  final String userId2;
  final int prepaymentAmount;
  final int driverCash;

  @override
  List<Object?> get props => [
        guid,
        firmId,
        driverComment,
        selectedVehicleId,
        selectedVehicleName,
        prepaymentAmount,
        driverCash,
        userId2,
      ];
}

class FetchCurrencyEvent extends OppositeOfferEvent {
  const FetchCurrencyEvent();

  @override
  List<Object?> get props => [];
}

class SelectCurrencyEvent extends OppositeOfferEvent {
  const SelectCurrencyEvent({
    required this.currency,
  });

  final CurrencyItemEntity currency;

  @override
  List<Object?> get props => [currency];
}

class SelectPaymentMethodEvent extends OppositeOfferEvent {
  const SelectPaymentMethodEvent({
    required this.status,
  });

  final String status;

  @override
  List<Object?> get props => [status];
}

class ChangePercentageStatusEvent extends OppositeOfferEvent {
  const ChangePercentageStatusEvent();

  @override
  List<Object?> get props => [];
}

class ChangeDriverCashEvent extends OppositeOfferEvent {
  const ChangeDriverCashEvent({
    required this.driverCash,
  });

  final String driverCash;

  @override
  List<Object?> get props => [driverCash];
}

class ChangePrepaymentCashEvent extends OppositeOfferEvent {
  const ChangePrepaymentCashEvent({
    required this.prepaymentCash,
  });

  final String prepaymentCash;

  @override
  List<Object?> get props => [prepaymentCash];
}
