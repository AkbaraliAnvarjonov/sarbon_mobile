import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/local/profile_local_data_source.dart';
import '../../data/data_source/remote/profile_remote_data_source.dart';
import '../../data/models/announcement/create_announcement/create_announcement_request.dart';
import '../../data/models/announcement/get_active_announcemant/get_active_announcement_request.dart';
import '../../data/models/cars_sale/cars_sale_search_request.dart';
import '../../data/models/cars_sale/recommendation_cars_request.dart';
import '../../data/models/complain/create_complain_request.dart';
import '../../data/models/create_car_request_model.dart';
import '../../data/models/favourite_cargo/favourite_cargo_request.dart';
import '../../data/models/favourite_cargo/put_favourite_request.dart';
import '../../data/models/user_update/put_user_info_request.dart';
import '../entities/announcement/addresses/addresses_entity.dart';
import '../entities/announcement/get_active_inactive_announcement/get_active_inactive_announcement_entity.dart';
import '../entities/announcement/type_car/type_cars_entity.dart';
import '../entities/announcement/type_currency/type_currency_entity.dart';
import '../entities/cars_sale/cars_sale_search_entity.dart';
import '../entities/cars_sale/recommendation_cars_entity.dart';
import '../entities/create_car_request_entity.dart';
import '../entities/favourite_cargo/favourite_cargo_response_entity.dart';
import '../entities/get_cargo_types_response_entity.dart';
import '../entities/get_load_types_response_entity.dart';
import '../entities/get_trailer_types_response_entity.dart';
import '../entities/get_user_cars_response_entity.dart';
import '../entities/get_user_info_response_entity.dart';
import '../entities/reference_book/reference_book_entity.dart';

part '../../data/repository/profile_repository_impl.dart';

sealed class ProfileRepository {
  Future<Either<Failure, GetUserInfoResponseEntity>> getUserInfo({
    required String userId,
  });

  Future<Either<Failure, GetUserCarsResponseEntity>> getUserCars({
    required int limit,
    required int offset,
    required String userId,
    required List<String> status,
  });

  Future<Either<Failure, GetCargoTypesResponseEntity>> getCargoTypes();

  Future<Either<Failure, GetTrailerTypesResponseEntity>> getTrailerTypes();

  Future<Either<Failure, GetTrailerTypesResponseEntity>> getFuelTypes();

  Future<Either<Failure, bool>> checkVehicleNumber({required String vehicleNumber});

  Future<Either<Failure, GetLoadTypesResponseEntity>> getLoadTypes();

  Future<Either<Failure, dynamic>> createCar({
    required CreateCarRequestEntity requestEntity,
  });

  Future<Either<Failure, bool>> updateCar({
    required CreateUpdateCarRequestModel request,
  });

  Future<Either<Failure, bool>> deleteCar({
    required String carId,
  });

  Future<Either<Failure, RecommendationCarsEntity>> recommendationCars({
    required RecommendationCarsRequest request,
  });

  Future<Either<Failure, SaleCarsSearchResultEntity>> getSaleCarsSearchResult({
    required CarsSaleSearchRequest request,
  });

  Future<Either<Failure, TypeCarsEntity>> getTypeCars();

  Future<Either<Failure, TypeCurrencyEntity>> getTypeCurrency();

  Future<Either<Failure, AddressesEntity>> getAddresses();

  Future<Either<Failure, bool>> createAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  });

  Future<Either<Failure, GetActiveInActiveAnnouncementEntity>>
      getActiveAnnouncement({
    required GetActiveAnnouncementRequest request,
  });

  Future<Either<Failure, bool>> updateAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  });

  Future<Either<Failure, FavouriteCargoResponseEntity>> fetchFavouriteCargo({
    required FavouriteCargoRequest request,
  });

  Future<Either<Failure, bool>> putFavouriteCargo({
    required PutFavouriteRequest request,
  });

  Future<Either<Failure, ReferenceBookEntity>> fetchReferenceBook();

  Future<Either<Failure, bool>> createComplain({
    required CreateComplainRequest request,
  });

  Future<Either<Failure, bool>> updateUserInfo({
    required PutUserInfoRequest request,
  });

  Future<Either<Failure, bool>> deleteUser({
    required String userId,
  });
}
