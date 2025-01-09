import '../../../../../core/either/either.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/announcement/addresses/addresses_entity.dart';
import '../../repository/profile_repository.dart';

class GetAddressesSaleCarUseCase implements UseCase<AddressesEntity, NoParams> {
  GetAddressesSaleCarUseCase(this.profileRepository);

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, AddressesEntity>> call(
    NoParams params,
  ) async {
    final response = await profileRepository.getAddresses();
    return response;
  }
}
