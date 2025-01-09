import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/favourite_cargo/put_favourite_request.dart';
import '../../repository/profile_repository.dart';

class PutFavouriteCargoUseCase implements UseCase<bool, PutFavouriteRequest> {
  PutFavouriteCargoUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutFavouriteRequest params,
  ) async {
    final response = await profileRepository.putFavouriteCargo(
      request: params,
    );
    return response;
  }
}
