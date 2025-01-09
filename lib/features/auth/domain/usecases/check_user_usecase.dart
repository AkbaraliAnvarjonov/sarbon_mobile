import 'package:sarbon_mobile/features/auth/domain/entities/check_user/check_user_response_entity.dart';

import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/check_user/check_user_request_entity.dart';
import '../repository/auth_repository.dart';

class CheckUserUseCase extends UseCase<CheckUserResponseEntity, CheckUserParams> {
  CheckUserUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, CheckUserResponseEntity>> call(
    CheckUserParams params,
  ) async {
    final response = await repository.checkUser(
      requestEntity: params.requestEntity,
    );
    return response;
  }
}

class CheckUserParams {
  CheckUserParams({
    required this.requestEntity,
  });

  final CheckUserRequestEntity requestEntity;
}
