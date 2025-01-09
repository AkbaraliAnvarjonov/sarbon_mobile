import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/get_user_info_response_entity.dart';
import '../repository/profile_repository.dart';

class GetUserInfoUseCase implements UseCase<GetUserInfoResponseEntity, String> {
  GetUserInfoUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, GetUserInfoResponseEntity>> call(
    String params,
  ) async {
    final response = await profileRepository.getUserInfo(userId: params);
    return response;
  }
}
