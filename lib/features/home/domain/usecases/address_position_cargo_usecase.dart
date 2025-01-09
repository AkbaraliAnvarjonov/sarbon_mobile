import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/cargo_details/address_position_cargo_entity.dart';
import '../repository/home_repository.dart';

class FetchAddressesPositionsByCargoUseCase
    implements
        UseCase<FetchAddressesPositionsCargoEntity,
            FetchAddressesPositionsParams> {
  FetchAddressesPositionsByCargoUseCase(this.ordersRepository);

  final HomeRepository ordersRepository;

  @override
  Future<Either<Failure, FetchAddressesPositionsCargoEntity>> call(
    FetchAddressesPositionsParams params,
  ) async {
    final response = await ordersRepository.fetchAddressPositionsCargo(
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
