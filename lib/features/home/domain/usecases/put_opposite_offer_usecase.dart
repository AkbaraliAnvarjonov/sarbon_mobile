import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/opposite_offer/put_opposite_offer_request_model.dart';
import '../repository/home_repository.dart';

class PutOppositeOfferUseCase implements UseCase<dynamic, PutOppositeOfferParams> {
  PutOppositeOfferUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, dynamic>> call(
    PutOppositeOfferParams params,
  ) async {
    final response = await homeRepository.putOppositeOffer(
      request: params.request,
    );
    return response;
  }
}

class PutOppositeOfferParams {
  const PutOppositeOfferParams({
    required this.request,
  });

  final PutOppositeOfferRequestModel request;
}
