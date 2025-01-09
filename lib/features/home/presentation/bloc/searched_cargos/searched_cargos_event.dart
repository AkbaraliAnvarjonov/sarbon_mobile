part of 'searched_cargos_bloc.dart';

abstract class SearchedCargosEvent extends Equatable {
  const SearchedCargosEvent();
}

class GetSearchedResultEvent extends SearchedCargosEvent {
  const GetSearchedResultEvent({
    required this.requestEntity,
  });

  final GetSearchedCargoItemsRequestEntity requestEntity;

  @override
  List<Object?> get props => [requestEntity];
}

class DeleteLikeCargoEvent extends SearchedCargosEvent {
  const DeleteLikeCargoEvent({
    required this.cargo,
  });

  final SearchedCargoItemEntity cargo;

  @override
  List<Object> get props => [
        cargo,
      ];
}

class PushLikeCargoEvent extends SearchedCargosEvent {
  const PushLikeCargoEvent({
    required this.cargo,
  });

  final SearchedCargoItemEntity cargo;

  @override
  List<Object> get props => [
        cargo,
      ];
}

/// Filter events

class FetchPaymentTypesEvent extends SearchedCargosEvent {
  const FetchPaymentTypesEvent();

  @override
  List<Object> get props => [];
}

class SelectedPaymentTypeEvent extends SearchedCargosEvent {
  const SelectedPaymentTypeEvent({
    required this.selectedTypePayment,
  });

  final TypePaymentListEntity selectedTypePayment;

  @override
  List<Object> get props => [
        selectedTypePayment,
      ];
}

class FetchCargoTypesEvent extends SearchedCargosEvent {
  const FetchCargoTypesEvent();

  @override
  List<Object> get props => [];
}

class SelectedCargoTypeEvent extends SearchedCargosEvent {
  const SelectedCargoTypeEvent({
    required this.selectedTypeCargo,
  });

  final TypeCargoListEntity selectedTypeCargo;

  @override
  List<Object> get props => [
        selectedTypeCargo,
      ];
}

class ChangeTypeOfCargoEvent extends SearchedCargosEvent {
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

class ApplyFilterEvent extends SearchedCargosEvent {
  const ApplyFilterEvent({
    required this.request,
  });

  final ApplyFilterRequest request;

  @override
  List<Object> get props => [
        request,
      ];
}

class ChangeVolumeEvent extends SearchedCargosEvent {
  const ChangeVolumeEvent({
    required this.volume,
  });

  final String volume;

  @override
  List<Object> get props => [
        volume,
      ];
}

class ChangeWeightEvent extends SearchedCargosEvent {
  const ChangeWeightEvent({
    required this.weight,
  });

  final String weight;

  @override
  List<Object> get props => [
        weight,
      ];
}
