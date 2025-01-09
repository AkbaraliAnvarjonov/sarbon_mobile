part of 'cargo_details_bloc.dart';

abstract class CargoDetailsEvent extends Equatable {
  const CargoDetailsEvent();
}

class GetCargoDetailsEvent extends CargoDetailsEvent {
  const GetCargoDetailsEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object?> get props => [guid];
}

class GetCargoAddressesPointEvent extends CargoDetailsEvent {
  const GetCargoAddressesPointEvent({
    required this.guid,
  });

  final String guid;

  @override
  List<Object?> get props => [guid];
}

class GetDriverOrdersEvent extends CargoDetailsEvent {
  const GetDriverOrdersEvent();

  @override
  List<Object?> get props => [];
}
