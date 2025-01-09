import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_user_cars_response_entity.dart';
import '../repository/profile_repository.dart';

class GetUserCarsUseCase
    implements UseCase<GetUserCarsResponseEntity, GetUserCarsParams> {
  GetUserCarsUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetUserCarsResponseEntity>> call(
    GetUserCarsParams params,
  ) async {
    final response = await profileRepository.getUserCars(
      limit: params.limit,
      offset: params.offset,
      userId: params.userId,
      status: params.status,
    );
    return response;
  }
}

class GetUserCarsParams {
  const GetUserCarsParams({
    required this.limit,
    required this.offset,
    required this.userId,
    required this.status,
  });

  final int limit;
  final int offset;
  final String userId;
  final List<String> status;
}
