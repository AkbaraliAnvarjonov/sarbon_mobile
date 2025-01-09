import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../router/app_routes.dart';
import '../../../data/models/favourite_cargo/favourite_cargo_request.dart';
import '../../entities/favourite_cargo/favourite_cargo_response_entity.dart';
import '../../repository/profile_repository.dart';

class FetchFavouriteCargoUseCase
    implements UseCase<FavouriteCargoResponseEntity, NoParams> {
  FetchFavouriteCargoUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, FavouriteCargoResponseEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.fetchFavouriteCargo(
      request: FavouriteCargoRequest(
        withRelations: true,
        usersIds: localSource.userId,
      ),
    );
    return response;
  }
}
