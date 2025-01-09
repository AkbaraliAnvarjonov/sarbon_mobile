import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../data/models/favourites/put_favourite_request_home.dart';
import '../repository/home_repository.dart';

class PutFavouriteCargoHomeUseCase
    implements UseCase<bool, PutFavouriteRequestHome> {
  PutFavouriteCargoHomeUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutFavouriteRequestHome params,
  ) async {
    final response = await homeRepository.putFavouriteCargo(
      request: params,
    );
    return response;
  }
}
