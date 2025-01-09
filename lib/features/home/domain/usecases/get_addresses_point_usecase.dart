import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/cargo_details/cargo_addresses_point_entity.dart';
import '../repository/home_repository.dart';

class GetCargoAddressesPointUseCase
    implements UseCase<CargoAddressesPointEntity, GetAddressesPointParams> {
  GetCargoAddressesPointUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, CargoAddressesPointEntity>> call(
    GetAddressesPointParams params,
  ) async {
    final response = await homeRepository.getAddressesPoint(
      guids: params.guids,
    );
    return response;
  }
}

class GetAddressesPointParams {
  const GetAddressesPointParams({
    required this.guids,
  });

  final List<String> guids;
}
