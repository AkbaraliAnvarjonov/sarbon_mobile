part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    this.bottomMenu = BottomMenu.home,
    this.userPosition = const Points(
      latitude: 1,
      longitude: 3,
    ),
    this.signedOrderCount = 0,
    this.orderId = '',
  });

  final BottomMenu bottomMenu;
  final Points userPosition;
  final int signedOrderCount;
  final String orderId;

  MainState copyWith({
    BottomMenu? bottomMenu,
    Points? userPosition,
    int? signedOrderCount,
    String? orderId,
  }) =>
      MainState(
        bottomMenu: bottomMenu ?? this.bottomMenu,
        userPosition: userPosition ?? this.userPosition,
        signedOrderCount: signedOrderCount ?? this.signedOrderCount,
        orderId: orderId ?? this.orderId,
      );

  @override
  List<Object?> get props => [
        bottomMenu,
        userPosition,
        signedOrderCount,
        orderId,
      ];
}
