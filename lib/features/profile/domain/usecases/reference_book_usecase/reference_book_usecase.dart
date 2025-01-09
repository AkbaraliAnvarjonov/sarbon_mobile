import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/reference_book/reference_book_entity.dart';
import '../../repository/profile_repository.dart';

class FetchReferenceBookUseCase
    implements UseCase<ReferenceBookEntity, NoParams> {
  FetchReferenceBookUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, ReferenceBookEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.fetchReferenceBook();
    return response;
  }
}
