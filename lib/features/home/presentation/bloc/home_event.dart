part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitialEvent extends HomeEvent {
  const InitialEvent();

  @override
  List<Object?> get props => [];
}

class SelectInitialAddressesEvent extends HomeEvent {
  const SelectInitialAddressesEvent({
    required this.address,
  });

  final String address;

  @override
  List<Object?> get props => [address];
}

class FetchCargosPaginationEvent extends HomeEvent {
  const FetchCargosPaginationEvent();

  @override
  List<Object?> get props => [];
}

class FetchCargosWithoutFilterPaginationEvent extends HomeEvent {
  const FetchCargosWithoutFilterPaginationEvent();

  @override
  List<Object?> get props => [];
}

class SelectFinalAddressesEvent extends HomeEvent {
  const SelectFinalAddressesEvent({
    required this.address,
  });

  final String address;

  @override
  List<Object?> get props => [address];
}

class SelectDateEvent extends HomeEvent {
  const SelectDateEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [date];
}

class GetActiveCarsEvent extends HomeEvent {
  const GetActiveCarsEvent();

  @override
  List<Object?> get props => [];
}

class SearchButtonPressedEvent extends HomeEvent {
  const SearchButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCargosEvent extends HomeEvent {
  const GetAllCargosEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCargosWithoutFilterEvent extends HomeEvent {
  const GetAllCargosWithoutFilterEvent();

  @override
  List<Object?> get props => [];
}

class DeleteLikeCargoEvent extends HomeEvent {
  const DeleteLikeCargoEvent({
    required this.cargo,
  });

  final SearchedCargoItemEntity cargo;

  @override
  List<Object> get props => [
        cargo,
      ];
}

class PushLikeCargoEvent extends HomeEvent {
  const PushLikeCargoEvent({
    required this.cargo,
  });

  final SearchedCargoItemEntity cargo;

  @override
  List<Object> get props => [
        cargo,
      ];
}

class FetchPaymentTypesEvent extends HomeEvent {
  const FetchPaymentTypesEvent();

  @override
  List<Object> get props => [];
}

class SelectedPaymentTypeEvent extends HomeEvent {
  const SelectedPaymentTypeEvent({
    required this.selectedTypePayment,
  });

  final TypePaymentListEntity selectedTypePayment;

  @override
  List<Object> get props => [
        selectedTypePayment,
      ];
}

class FetchCargoTypesEvent extends HomeEvent {
  const FetchCargoTypesEvent();

  @override
  List<Object> get props => [];
}

class SelectedCargoTypeEvent extends HomeEvent {
  const SelectedCargoTypeEvent({
    required this.selectedTypeCargo,
  });

  final TypeCargoListEntity selectedTypeCargo;

  @override
  List<Object> get props => [
        selectedTypeCargo,
      ];
}

class ChangeTypeOfCargoEvent extends HomeEvent {
  const ChangeTypeOfCargoEvent({
    required this.isTakeAllUnloads,
    required this.isLoadAroundTheClock,
  });

  final bool isTakeAllUnloads;
  final bool isLoadAroundTheClock;

  @override
  List<Object> get props => [
        isTakeAllUnloads,
        isLoadAroundTheClock,
      ];
}

class ApplyFilterEvent extends HomeEvent {
  const ApplyFilterEvent({
    required this.request,
  });

  final ApplyFilterRequest request;

  @override
  List<Object> get props => [
        request,
      ];
}

class ChangeVolumeEvent extends HomeEvent {
  const ChangeVolumeEvent({
    required this.volume,
  });

  final String volume;

  @override
  List<Object> get props => [
        volume,
      ];
}

class ChangeVolume2Event extends HomeEvent {
  const ChangeVolume2Event({
    required this.volume,
  });

  final String volume;

  @override
  List<Object> get props => [
        volume,
      ];
}

class ChangeWeightEvent extends HomeEvent {
  const ChangeWeightEvent({
    required this.weight,
  });

  final String weight;

  @override
  List<Object> get props => [
        weight,
      ];
}

class ChangeWeight2Event extends HomeEvent {
  const ChangeWeight2Event({
    required this.weight,
  });

  final String weight;

  @override
  List<Object> get props => [
        weight,
      ];
}

class RemoveFilterEvent extends HomeEvent {
  const RemoveFilterEvent();

  @override
  List<Object> get props => [];
}

class HomeEventClearFromAddress extends HomeEvent {
  const HomeEventClearFromAddress();

  @override
  List<Object> get props => [];
}

class HomeEventClearToAddress extends HomeEvent {
  const HomeEventClearToAddress();

  @override
  List<Object> get props => [];
}

class HomeRefresh extends HomeEvent {
  const HomeRefresh();

  @override
  List<Object> get props => [];
}

class GetVehicleType extends HomeEvent {
  const GetVehicleType();

  @override
  List<Object> get props => [];
}
