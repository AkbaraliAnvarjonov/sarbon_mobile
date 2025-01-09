import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search/get_addresses_response_entity.dart';
import '../repository/home_repository.dart';

class GetAddressesUseCase
    implements UseCase<GetAddressesResponseEntity, GetAddressesParams> {
  GetAddressesUseCase(this.homeRepository);

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, GetAddressesResponseEntity>> call(
    GetAddressesParams params,
  ) async {
    final response = await homeRepository.getAddresses(
      limit: params.limit,
      offset: params.offset,
      searchedText: params.searchedText,
    );
    return response;
  }
}

class GetAddressesParams {
  const GetAddressesParams({
    required this.limit,
    required this.offset,
    this.searchedText,
  });

  final int limit;
  final int offset;
  final String? searchedText;
}
