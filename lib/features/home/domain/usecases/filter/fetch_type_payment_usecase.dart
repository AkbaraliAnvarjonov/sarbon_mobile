import '../../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/types_payment/types_payment_entity.dart';
import '../../repository/home_repository.dart';

class FetchTypePaymentUseCase implements UseCase<TypesPaymentEntity, NoParams> {
  FetchTypePaymentUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, TypesPaymentEntity>> call(
      NoParams params,
      ) async {
    final response = await homeRepository.fetchTypesPayment();
    return response;
  }
}