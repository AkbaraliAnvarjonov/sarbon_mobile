import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class UpdateUserPasswordUseCase implements UseCase<bool, String> {
  UpdateUserPasswordUseCase(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    String password,
  ) async {
    final response = await authRepository.putUserPassword(
      password: password,
    );
    return response;
  }
}
