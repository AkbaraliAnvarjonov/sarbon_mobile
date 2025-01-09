part of 'sale_car_bloc.dart';

abstract class SaleCarEvent extends Equatable {
  const SaleCarEvent();
}

class FocusChangedEvent extends SaleCarEvent {
  final bool hasFocus;

  const FocusChangedEvent({
    required this.hasFocus,
  });

  @override
  List<Object> get props => [hasFocus];
}

class SetSearchSavedListEvent extends SaleCarEvent {
  const SetSearchSavedListEvent();

  @override
  List<Object> get props => [];
}

class InsertItemSearchSavedListEvent extends SaleCarEvent {
  final String searchValue;

  const InsertItemSearchSavedListEvent({
    required this.searchValue,
  });

  @override
  List<Object> get props => [searchValue];
}

class DeleteItemSearchSavedListEvent extends SaleCarEvent {
  final int index;

  const DeleteItemSearchSavedListEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

class GetSimilarSearchedListEvent extends SaleCarEvent {
  final String searchValue;

  const GetSimilarSearchedListEvent({
    required this.searchValue,
  });

  @override
  List<Object> get props => [searchValue];
}

class GetRecommendationCarsEvent extends SaleCarEvent {
  const GetRecommendationCarsEvent();

  @override
  List<Object> get props => [];
}

class GetCarsSaleSearchEvent extends SaleCarEvent {
  final String searchValue;

  const GetCarsSaleSearchEvent({
    required this.searchValue,
  });

  @override
  List<Object> get props => [searchValue];
}
