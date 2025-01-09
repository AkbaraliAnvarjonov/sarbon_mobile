import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/cargo_details/get_cargo_details_response_entity.dart';
import '../repository/home_repository.dart';

class GetCargoDetailsUseCase
    implements UseCase<GetCargoDetailsResponseEntity?, GetCargoDetailsParams> {
  GetCargoDetailsUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetCargoDetailsResponseEntity?>> call(
    GetCargoDetailsParams params,
  ) async {
    final response = await homeRepository.getCargoDetails(
      guid: params.guid,
    );
    return response;
  }
}

class GetCargoDetailsParams {
  const GetCargoDetailsParams({
    required this.guid,
  });

  final String guid;
}
