import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/send_code/send_code_request_entity.dart';
import '../entities/send_code/send_code_response_entity.dart';
import '../repository/auth_repository.dart';

class SendCodeUseCase extends UseCase<SendCodeResponseEntity, SendCodeParams> {
  SendCodeUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, SendCodeResponseEntity>> call(
    SendCodeParams params,
  ) async {
    final response = await repository.sendCodeOtp(
      requestEntity: params.requestEntity,
    );
    return response;
  }
}

class SendCodeParams {
  SendCodeParams({
    required this.requestEntity,
  });

  final SendCodeRequestEntity requestEntity;
}
