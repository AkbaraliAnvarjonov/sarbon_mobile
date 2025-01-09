import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/cars_sale/cars_sale_search_request.dart';
import '../../entities/cars_sale/cars_sale_search_entity.dart';
import '../../repository/profile_repository.dart';

class GetCarsSaleSearchUseCase
    implements UseCase<SaleCarsSearchResultEntity, CarsSaleSearchParams> {
  GetCarsSaleSearchUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, SaleCarsSearchResultEntity>> call(
    CarsSaleSearchParams params,
  ) async {
    final response = await profileRepository.getSaleCarsSearchResult(
      request: CarsSaleSearchRequest(
        limit: params.limit,
        offset: params.offset,
        search: '',
        withRelations: true,
        name: [params.search],
      ),
    );
    return response;
  }
}

class CarsSaleSearchParams {
  const CarsSaleSearchParams({
    required this.limit,
    required this.offset,
    required this.search,
  });

  final int limit;
  final int offset;
  final String search;
}
