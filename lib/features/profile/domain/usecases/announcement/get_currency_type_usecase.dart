import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/announcement/type_currency/type_currency_entity.dart';
import '../../repository/profile_repository.dart';

class GetCurrencyTypesUseCase implements UseCase<TypeCurrencyEntity, NoParams> {
  GetCurrencyTypesUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, TypeCurrencyEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.getTypeCurrency();
    return response;
  }
}
