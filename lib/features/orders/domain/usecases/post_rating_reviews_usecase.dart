import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/post_rating_review_request_entity.dart';
import '../repository/orders_repository.dart';

class PostRatingReviewsUseCase
    implements UseCase<dynamic, PostRatingReviewsParams> {
  PostRatingReviewsUseCase(this.ordersRepository);

  final OrdersRepository ordersRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PostRatingReviewsParams params,
  ) async {
    final response = await ordersRepository.postRatingReviews(
      requestEntity: params.requestEntity,
    );
    return response;
  }
}

class PostRatingReviewsParams {
  const PostRatingReviewsParams({
    required this.requestEntity,
  });

  final RatingReviewsRequestEntity requestEntity;
}
