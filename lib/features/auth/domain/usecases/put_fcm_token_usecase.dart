import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class PutFcmTokenUseCase implements UseCase<bool, PutFcmTokenParams> {
  PutFcmTokenUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutFcmTokenParams params,
  ) async {
    final response = await authRepository.putFcmToken(
      fcmToken: params.fcmToken,
      loginId: params.loginId,
      userId: params.userId,
      registerId: params.registerId,
    );
    return response;
  }
}

class PutFcmTokenParams {
  final String fcmToken;
  final String loginId;
  final String userId;
  final String registerId;

  PutFcmTokenParams({
    required this.fcmToken,
    required this.loginId,
    required this.userId,
    required this.registerId,
  });
}
