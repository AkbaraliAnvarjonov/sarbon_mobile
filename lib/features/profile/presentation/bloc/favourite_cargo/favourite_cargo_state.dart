part of 'favourite_cargo_bloc.dart';

class FavouriteCargoState extends Equatable {
  const FavouriteCargoState({
    this.favouriteFetchStatus = ApiStatus.initial,
    this.putFavouriteStatus = ApiStatus.initial,
    this.favouriteCargoes = const [],
  });

  final ApiStatus favouriteFetchStatus;
  final ApiStatus putFavouriteStatus;
  final List<FavouriteCargoListEntity> favouriteCargoes;

  FavouriteCargoState copyWith({
    ApiStatus? favouriteFetchStatus,
    ApiStatus? putFavouriteStatus,
    List<FavouriteCargoListEntity>? favouriteCargoes,
  }) =>
      FavouriteCargoState(
        favouriteFetchStatus: favouriteFetchStatus ?? this.favouriteFetchStatus,
        putFavouriteStatus: putFavouriteStatus ?? this.putFavouriteStatus,
        favouriteCargoes: favouriteCargoes ?? this.favouriteCargoes,
      );

  @override
  List<Object?> get props => [
        favouriteFetchStatus,
        putFavouriteStatus,
        favouriteCargoes,
      ];
}
