import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class PostOppositeOfferUseCase
    implements UseCase<dynamic, PostOppositeOfferParams> {
  PostOppositeOfferUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PostOppositeOfferParams params,
  ) async {
    final response = await homeRepository.postOppositeOffer(
      orderId: params.orderId,
    );
    return response;
  }
}

class PostOppositeOfferParams {
  const PostOppositeOfferParams({
    required this.orderId,
  });

  final String orderId;
}
