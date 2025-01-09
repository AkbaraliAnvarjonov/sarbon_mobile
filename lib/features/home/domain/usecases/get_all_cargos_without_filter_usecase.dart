import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search/get_searched_cargo_items_request_entity.dart';
import '../entities/search/get_searched_cargo_items_response_entity.dart';
import '../repository/home_repository.dart';
import 'get_all_cargos_use_case.dart';

class GetAllCargosWithoutFilterUseCase implements UseCase<GetSearchedCargoItemsResponseEntity, GetAllCargoItemsParams> {
  GetAllCargosWithoutFilterUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> call(
    GetAllCargoItemsParams params,
  ) async {
    final response = await homeRepository.getAllCargoItemsWithoutFilter(
      limit: params.limit,
      offset: params.offset,
    );
    return response;
  }
}
