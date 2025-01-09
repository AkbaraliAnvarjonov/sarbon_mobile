import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/announcement/addresses/get_addresses_response.dart';
import '../../models/announcement/create_announcement/create_announcement_request.dart';
import '../../models/announcement/get_active_announcemant/get_active_announcement_request.dart';
import '../../models/announcement/get_active_announcemant/get_active_announcement_response.dart';
import '../../models/announcement/type_car/type_cars_response.dart';
import '../../models/announcement/type_currency/type_currency_response.dart';
import '../../models/cars_sale/cars_sale_search_request.dart';
import '../../models/cars_sale/cars_sale_search_response.dart';
import '../../models/cars_sale/recommendation_cars_request.dart';
import '../../models/cars_sale/recommendation_cars_response.dart';
import '../../models/complain/create_complain_request.dart';
import '../../models/create_car_request_model.dart';
import '../../models/favourite_cargo/favourite_cargo_request.dart';
import '../../models/favourite_cargo/favourite_cargo_response.dart';
import '../../models/favourite_cargo/put_favourite_request.dart';
import '../../models/get_cargo_types_response_model.dart';
import '../../models/get_load_types_response_model.dart';
import '../../models/get_trailer_types_response_model.dart';
import '../../models/get_user_cars_response_model.dart';
import '../../models/get_user_info_response_model.dart';
import '../../models/reference_book/reference_book_response.dart';
import '../../models/user_update/put_user_info_request.dart';

part 'profile_remote_data_source_impl.dart';

abstract class ProfileRemoteDataSource {
  Future<GetUserInfoResponseModel> getUserInfo({
    required String userId,
  });

  Future<GetUserCarsResponseModel> getUserCars({
    required int limit,
    required int offset,
    required String userId,
    required List<String> status,
  });

  Future<GetCargoTypesResponseModel> getCargoTypes();

  Future<GetTrailerTypesResponseModel> getTrailerTypes();

  Future<GetTrailerTypesResponseModel> getFuelTypes();

  Future<GetLoadTypesResponseModel> getLoadTypes();

  Future<dynamic> createCar({
    required CreateUpdateCarRequestModel request,
  });

  Future<bool> updateCar({
    required CreateUpdateCarRequestModel request,
  });

  Future<bool> deleteCar({
    required String carId,
  });

  Future<RecommendationCarsResponse> getRecommendationCars({
    required RecommendationCarsRequest request,
  });

  Future<CarsSaleSearchResponse> getSaleCarsSearchResult({
    required CarsSaleSearchRequest request,
  });

  Future<TypeCarsResponse> getTypeCars();

  Future<bool> checkVehicleNumber({required String vehicleNumber});

  Future<TypeCurrencyResponse> getTypeCurrency();

  Future<GetAddressesResponse> getAddresses();

  Future<bool> createAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  });

  Future<GetActiveInActiveAnnouncementResponse> getActiveAnnouncement({
    required GetActiveAnnouncementRequest request,
  });

  Future<bool> updateAnnouncement({
    required CreateAndUpdateAnnouncementRequest request,
  });

  Future<FavouriteCargoResponse> fetchFavouriteCargo({
    required FavouriteCargoRequest request,
  });

  Future<bool> putFavouriteCargo({
    required PutFavouriteRequest request,
  });

  Future<ReferenceBookResponse> fetchReferenceBook();

  Future<bool> createComplain({
    required CreateComplainRequest request,
  });

  Future<bool> putUserInfo({
    required PutUserInfoRequest request,
  });

  Future<bool> deleteUser({
    required String userId,
  });
}
