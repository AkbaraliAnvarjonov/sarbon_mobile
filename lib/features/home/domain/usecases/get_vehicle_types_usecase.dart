import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../repository/home_repository.dart';

class GetVehicleTypesUseCase
    implements UseCase<GetVehicleTypesResponseEntity, GetVehicleTypesParams> {
  GetVehicleTypesUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetVehicleTypesResponseEntity>> call(
    GetVehicleTypesParams params,
  ) async {
    final response = await homeRepository.getVehicleTypes(
      limit: params.limit,
      offset: params.offset,
    );
    return response;
  }
}

class GetVehicleTypesParams {
  const GetVehicleTypesParams({
    required this.limit,
    required this.offset,
  });

  final int limit;
  final int offset;
}
