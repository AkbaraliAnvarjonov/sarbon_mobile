part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventChanged extends MainEvent {
  const MainEventChanged(this.menu);

  final BottomMenu menu;

  @override
  List<Object?> get props => [menu];
}

class PutTrackingEvent extends MainEvent {
  const PutTrackingEvent({required this.orderId});

  final String orderId;

  @override
  List<Object?> get props => [orderId];
}

class FetchSignedOrdersCountMainEvent extends MainEvent {
  const FetchSignedOrdersCountMainEvent();

  @override
  List<Object?> get props => [];
}

class PutLatLongEvent extends MainEvent {
  const PutLatLongEvent();

  @override
  List<Object?> get props => [];
}
