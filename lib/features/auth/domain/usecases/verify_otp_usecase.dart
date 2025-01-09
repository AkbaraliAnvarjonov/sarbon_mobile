import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/verify_otp/verify_otp_request_model.dart';
import '../repository/auth_repository.dart';

class VerifyOtpUseCase extends UseCase<bool, VerifyCodeParams> {
  VerifyOtpUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(VerifyCodeParams params) async {
    final response = await repository.verifyOtp(
      requestEntity: params.requestEntity,
    );
    return response;
  }
}

class VerifyCodeParams {
  VerifyCodeParams({
    required this.requestEntity,
  });

  final VerifyOtpRequestModel requestEntity;
}
