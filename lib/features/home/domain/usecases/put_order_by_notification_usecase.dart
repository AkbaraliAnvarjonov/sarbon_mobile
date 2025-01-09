import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class PutOrderByNotificationUseCase implements UseCase<bool, PutOrderParams> {
  PutOrderByNotificationUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, bool>> call(
    PutOrderParams params,
  ) async {
    final response = await homeRepository.putOrder(
      orderId: params.orderId,
      status: params.status,
    );
    return response;
  }
}

class PutOrderParams {
  const PutOrderParams({
    required this.orderId,
    required this.status,
  });

  final String orderId;
  final List<String> status;
}
