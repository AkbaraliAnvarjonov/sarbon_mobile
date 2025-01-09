import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/api_status.dart';
import '../../../data/models/favourite_cargo/put_favourite_request.dart';
import '../../../domain/entities/favourite_cargo/favourite_cargo_response_entity.dart';
import '../../../domain/usecases/favourite_cargo/fetch_favourite_cargo_uscase.dart';
import '../../../domain/usecases/favourite_cargo/put_favourite_cargo_usecase.dart';

part 'favourite_cargo_event.dart';

part 'favourite_cargo_state.dart';

class FavouriteCargoBloc extends Bloc<FavouriteCargoEvent, FavouriteCargoState> {
  FavouriteCargoBloc({
    required this.fetchFavouriteCargoUseCase,
    required this.putFavouriteCargoUseCase,
  }) : super(const FavouriteCargoState()) {
    on<FetchFavouriteCargoEvent>(_fetchFavouriteCargo);
    on<PutFavouriteCargoEvent>(_putFavouriteCargo);
  }

  final FetchFavouriteCargoUseCase fetchFavouriteCargoUseCase;
  final PutFavouriteCargoUseCase putFavouriteCargoUseCase;

  Future<void> _fetchFavouriteCargo(
    FetchFavouriteCargoEvent event,
    Emitter<FavouriteCargoState> emit,
  ) async {
    emit(state.copyWith(favouriteFetchStatus: ApiStatus.loading));
    final response = await fetchFavouriteCargoUseCase(NoParams());
    response.fold(
      (failure) {
        emit(state.copyWith(favouriteFetchStatus: ApiStatus.error));
      },
      (favouriteCargoes) {
        final List<FavouriteCargoListEntity> newFavouriteCargoes = [];
        for (final element in favouriteCargoes.favouriteCargoes) {
          if (localSource.favouriteCargoes.contains(element.guid)) {
            newFavouriteCargoes.add(element);
          }
        }
        emit(
          state.copyWith(
            favouriteFetchStatus: ApiStatus.success,
            favouriteCargoes: newFavouriteCargoes,
          ),
        );
      },
    );
  }

  Future<void> _putFavouriteCargo(
    PutFavouriteCargoEvent event,
    Emitter<FavouriteCargoState> emit,
  ) async {
    final List<FavouriteCargoListEntity> newFavouriteCargoes = [
      ...state.favouriteCargoes,
    ];
    newFavouriteCargoes.remove(event.cargo);
    await localSource.setFavouriteCargoes(
      newFavouriteCargoes.map((e) => e.guid ?? '').toList(),
    );
    emit(state.copyWith(putFavouriteStatus: ApiStatus.loading));
    final response = await putFavouriteCargoUseCase(
      PutFavouriteRequest(
        data: Data(
          guid: localSource.userId,
          cargoIds: newFavouriteCargoes.map((e) => e.guid ?? '').toList(),
        ),
      ),
    );
    response.fold(
      (failure) {
        emit(state.copyWith(putFavouriteStatus: ApiStatus.error));
      },
      (favouriteCargoes) {
        emit(
          state.copyWith(
            putFavouriteStatus: ApiStatus.success,
            favouriteCargoes: newFavouriteCargoes,
          ),
        );
      },
    );
  }
}
