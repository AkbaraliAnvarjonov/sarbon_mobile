import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/opposite_offer/fetch_currency_entity.dart';
import '../repository/home_repository.dart';

class FetchCurrencyUseCase implements UseCase<FetchCurrencyEntity, NoParams> {
  FetchCurrencyUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, FetchCurrencyEntity>> call(
    NoParams params,
  ) async {
    final response = await homeRepository.fetchCurrency();
    return response;
  }
}
