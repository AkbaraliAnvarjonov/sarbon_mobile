part of 'favourite_cargo_bloc.dart';

abstract class FavouriteCargoEvent extends Equatable {
  const FavouriteCargoEvent();
}

class FetchFavouriteCargoEvent extends FavouriteCargoEvent {
  const FetchFavouriteCargoEvent();

  @override
  List<Object> get props => [];
}

class RemoveFavouriteCargoEvent extends FavouriteCargoEvent {
  const RemoveFavouriteCargoEvent({
    required this.cargo,
  });

  final FavouriteCargoListEntity cargo;

  @override
  List<Object> get props => [cargo];
}

class PutFavouriteCargoEvent extends FavouriteCargoEvent {
  const PutFavouriteCargoEvent({
    required this.cargo,
  });

  final FavouriteCargoListEntity cargo;

  @override
  List<Object> get props => [
        cargo,
      ];
}
