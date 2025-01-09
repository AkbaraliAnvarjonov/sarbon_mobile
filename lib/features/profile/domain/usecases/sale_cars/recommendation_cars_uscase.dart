import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../data/models/cars_sale/recommendation_cars_request.dart';
import '../../entities/cars_sale/recommendation_cars_entity.dart';
import '../../repository/profile_repository.dart';

class GetRecommendationCarsUseCase
    implements UseCase<RecommendationCarsEntity, RecommendationCarsParams> {
  GetRecommendationCarsUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, RecommendationCarsEntity>> call(
    RecommendationCarsParams params,
  ) async {
    final response = await profileRepository.recommendationCars(
      request: RecommendationCarsRequest(
        limit: params.limit,
        offset: params.offset,
        search: '',
        withRelations: true,
      ),
    );
    return response;
  }
}

class RecommendationCarsParams {
  const RecommendationCarsParams({
    required this.limit,
    required this.offset,
  });

  final int limit;
  final int offset;
}
