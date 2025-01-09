import '../../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/types_cargo/types_cargo_entity.dart';
import '../../repository/home_repository.dart';

class FetchTypeCargoUseCase implements UseCase<TypesCargoEntity, NoParams> {
  FetchTypeCargoUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, TypesCargoEntity>> call(
    NoParams params,
  ) async {
    final response = await homeRepository.fetchTypesCargo();
    return response;
  }
}

