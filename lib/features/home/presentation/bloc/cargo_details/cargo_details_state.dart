part of 'cargo_details_bloc.dart';

class CargoDetailsState extends Equatable {
  const CargoDetailsState({
    this.status = ApiStatus.initial,
    this.cargoPointStatus = ApiStatus.initial,
    this.signedOrdersStatus = ApiStatus.initial,
    this.addresses = const [],
    this.details,
    this.finishedOrdersCount = 0,
    this.addressPositions = const [],
  });

  final ApiStatus status;
  final ApiStatus signedOrdersStatus;
  final ApiStatus cargoPointStatus;
  final int finishedOrdersCount;
  final GetCargoDetailsResponseEntity? details;
  final List<CargoAddressesPoint> addresses;
  final List<FetchListPositionsEntity> addressPositions;

  @override
  List<Object?> get props => [
        status,
        details,
        cargoPointStatus,
        signedOrdersStatus,
        addresses,
        finishedOrdersCount,
        addressPositions,
      ];

  CargoDetailsState copyWith({
    ApiStatus? status,
    ApiStatus? signedOrdersStatus,
    GetCargoDetailsResponseEntity? details,
    bool? isOrderFinished,
    int? finishedOrdersCount,
    ApiStatus? cargoPointStatus,
    List<CargoAddressesPoint>? addresses,
    List<FetchListPositionsEntity>? addressPositions,
  }) =>
      CargoDetailsState(
        status: status ?? this.status,
        details: details ?? this.details,
        finishedOrdersCount: finishedOrdersCount ?? this.finishedOrdersCount,
        cargoPointStatus: cargoPointStatus ?? this.cargoPointStatus,
        addresses: addresses ?? this.addresses,
        addressPositions: addressPositions ?? this.addressPositions,
        signedOrdersStatus: signedOrdersStatus ?? this.signedOrdersStatus,
      );
}
