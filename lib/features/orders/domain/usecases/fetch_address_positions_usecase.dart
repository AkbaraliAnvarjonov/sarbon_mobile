import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/address_positions/fetch_address_positions_entity.dart';
import '../repository/orders_repository.dart';

class FetchAddressesPositionsUseCase
    implements
        UseCase<FetchAddressesPositionsListEntity,
            FetchAddressesPositionsParams> {
  FetchAddressesPositionsUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, FetchAddressesPositionsListEntity>> call(
    FetchAddressesPositionsParams params,
  ) async {
    final response = await ordersRepository.fetchAddressPositions(
      guid: params.guid,
    );
    return response;
  }
}

class FetchAddressesPositionsParams {
  const FetchAddressesPositionsParams({
    required this.guid,
  });

  final String guid;
}
