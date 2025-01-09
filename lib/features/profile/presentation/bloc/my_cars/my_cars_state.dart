part of 'my_cars_bloc.dart';

class MyCarsState extends Equatable {
  const MyCarsState({
    this.status = MyCarsStateStatus.initial,
    this.tabIndex = 0,
    this.limit = 6,
    this.activeCarsOffset = 1,
    this.inActiveCarsOffset = 1,
    this.activeCars,
    this.inActiveCars,
    this.activeCarsCount = 0,
    this.inActiveCarsCount = 0,
    this.activeCarsPagination = MyCarsStateStatus.initial,
    this.inActiveCarsPagination = MyCarsStateStatus.initial,
  });

  final MyCarsStateStatus status;
  final MyCarsStateStatus activeCarsPagination;
  final MyCarsStateStatus inActiveCarsPagination;
  final int tabIndex;
  final int limit;
  final int activeCarsOffset;
  final int inActiveCarsOffset;
  final List<UserCarEntity>? activeCars;
  final List<UserCarEntity>? inActiveCars;
  final int activeCarsCount;
  final int inActiveCarsCount;

  @override
  List<Object?> get props => [
        status,
        tabIndex,
        limit,
        activeCarsOffset,
        inActiveCarsOffset,
        activeCars,
        inActiveCars,
        activeCarsCount,
        inActiveCarsCount,
        activeCarsPagination,
        inActiveCarsPagination
      ];

  MyCarsState copyWith({
    MyCarsStateStatus? status,
    MyCarsStateStatus? activeCarsPagination,
    MyCarsStateStatus? inActiveCarsPagination,
    int? tabIndex,
    int? limit,
    int? activeCarsOffset,
    int? inActiveCarsOffset,
    List<UserCarEntity>? activeCars,
    List<UserCarEntity>? inActiveCars,
    int? activeCarsCount,
    int? inActiveCarsCount,
  }) =>
      MyCarsState(
        status: status ?? this.status,
        tabIndex: tabIndex ?? this.tabIndex,
        limit: limit ?? this.limit,
        activeCarsOffset: activeCarsOffset ?? this.activeCarsOffset,
        inActiveCarsOffset: inActiveCarsOffset ?? this.inActiveCarsOffset,
        activeCars: activeCars ?? this.activeCars,
        inActiveCars: inActiveCars ?? this.inActiveCars,
        activeCarsCount: activeCarsCount ?? this.activeCarsCount,
        inActiveCarsCount: inActiveCarsCount ?? this.inActiveCarsCount,
        activeCarsPagination: activeCarsPagination ?? this.activeCarsPagination,
        inActiveCarsPagination: inActiveCarsPagination ?? this.inActiveCarsPagination,
      );
}

enum MyCarsStateStatus { initial, loading, error, success }

extension MyCarsStateStatusX on MyCarsStateStatus {
  bool get isInitial => this == MyCarsStateStatus.initial;

  bool get isLoading => this == MyCarsStateStatus.loading;

  bool get isSuccess => this == MyCarsStateStatus.success;

  bool get isError => this == MyCarsStateStatus.error;
}
