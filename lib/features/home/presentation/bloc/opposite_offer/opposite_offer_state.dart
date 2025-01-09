part of 'opposite_offer_bloc.dart';

class OppositeOfferState extends Equatable {
  const OppositeOfferState({
    this.status = ApiStatus.initial,
    this.prepaymentTabIndex = 0,
    this.payAfterCompletionTabIndex = 0,
    this.vehicleTypes,
    this.selectedVehicleType,
    this.prepaymentPercentage = '',
    this.prepaymentAmount = '',
    this.afterCompletionPercentage = '',
    this.afterCompletionAmount = '',
    this.currencyList = const [],
    this.selectedCurrency,
    this.paymentMethodStatus = '',
    this.showPercentage = false,
    this.driverCash = '',
    this.prepaymentCash = '',
  });

  final ApiStatus status;
  final List<VehicleTypeItemEntity>? vehicleTypes;
  final VehicleTypeItemEntity? selectedVehicleType;
  final int prepaymentTabIndex;
  final int payAfterCompletionTabIndex;
  final String prepaymentPercentage;
  final String prepaymentAmount;
  final String afterCompletionPercentage;
  final String afterCompletionAmount;
  final List<CurrencyItemEntity> currencyList;
  final CurrencyItemEntity? selectedCurrency;
  final String paymentMethodStatus;
  final bool showPercentage;
  final String driverCash;
  final String prepaymentCash;

  @override
  List<Object?> get props => [
        status,
        vehicleTypes,
        selectedVehicleType,
        prepaymentTabIndex,
        payAfterCompletionTabIndex,
        prepaymentPercentage,
        prepaymentAmount,
        afterCompletionPercentage,
        afterCompletionAmount,
        currencyList,
        selectedCurrency,
        paymentMethodStatus,
        showPercentage,
        driverCash,
        prepaymentCash,
      ];

  OppositeOfferState copyWith({
    ApiStatus? status,
    List<VehicleTypeItemEntity>? vehicleTypes,
    VehicleTypeItemEntity? selectedVehicleType,
    int? vehicleTypesCount,
    int? limit,
    int? offset,
    int? prepaymentTabIndex,
    int? payAfterCompletionTabIndex,
    String? prepaymentPercentage,
    String? prepaymentAmount,
    String? afterCompletionPercentage,
    String? afterCompletionAmount,
    List<CurrencyItemEntity>? currencyList,
    CurrencyItemEntity? selectedCurrency,
    String? paymentMethodStatus,
    bool? showPercentage,
    String? driverCash,
    String? prepaymentCash,
  }) =>
      OppositeOfferState(
        status: status ?? this.status,
        vehicleTypes: vehicleTypes ?? this.vehicleTypes,
        selectedVehicleType: selectedVehicleType ?? this.selectedVehicleType,
        prepaymentTabIndex: prepaymentTabIndex ?? this.prepaymentTabIndex,
        payAfterCompletionTabIndex:
            payAfterCompletionTabIndex ?? this.payAfterCompletionTabIndex,
        prepaymentPercentage: prepaymentPercentage ?? this.prepaymentPercentage,
        prepaymentAmount: prepaymentAmount ?? this.prepaymentAmount,
        afterCompletionPercentage:
            afterCompletionPercentage ?? this.afterCompletionPercentage,
        afterCompletionAmount:
            afterCompletionAmount ?? this.afterCompletionAmount,
        currencyList: currencyList ?? this.currencyList,
        selectedCurrency: selectedCurrency ?? this.selectedCurrency,
        paymentMethodStatus: paymentMethodStatus ?? this.paymentMethodStatus,
        showPercentage: showPercentage ?? this.showPercentage,
        driverCash: driverCash ?? this.driverCash,
        prepaymentCash: prepaymentCash ?? this.prepaymentCash,
      );
}
