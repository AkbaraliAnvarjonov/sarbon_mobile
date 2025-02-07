import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../router/app_routes.dart';
import '../../models/address_position/addres_positions_cargo.dart';
import '../../models/address_position/address_position_cargo_request.dart';
import '../../models/apply_filter/apply_filter_request.dart';
import '../../models/cargo_details/cargo_addresses_point_request.dart';
import '../../models/cargo_details/cargo_point_addresses_response.dart';
import '../../models/cargo_details/get_cargo_details_response_model.dart';
import '../../models/favourites/put_favourite_request_home.dart';
import '../../models/news/get_news_response_model.dart';
import '../../models/notification/get_order_by_notification/fetch_address_position_notification_request.dart';
import '../../models/notification/get_order_by_notification/fetch_address_position_notification_response.dart';
import '../../models/notification/get_order_by_notification/get_addresses_by_notification.dart';
import '../../models/notification/get_order_by_notification/get_order_by_notification.dart';
import '../../models/notification/get_order_by_notification/request_addresses_by_notification.dart';
import '../../models/notification/notification_request.dart';
import '../../models/notification/notification_response.dart';
import '../../models/notification/put_notification_request.dart';
import '../../models/opposite_offer/fetch_currency_response.dart';
import '../../models/opposite_offer/get_vehicle_types_response_model.dart';
import '../../models/opposite_offer/put_opposite_offer_request_model.dart';
import '../../models/route/create_route/create_route_request.dart';
import '../../models/route/fetch_routes/fetch_routes_request.dart';
import '../../models/route/fetch_routes/fetch_routes_response.dart';
import '../../models/route/update_route/update_route_request.dart';
import '../../models/search/filter_cargo_response_model.dart';
import '../../models/search/get_addresses_response_model.dart';
import '../../models/search/get_searched_cargo_items_request_model.dart';
import '../../models/search/get_searched_cargo_items_response_model.dart';
import '../../models/types_cargo/types_cargo_response.dart';
import '../../models/types_payment/types_payment_response.dart';

part 'home_remote_data_source_impl.dart';

abstract class HomeRemoteDataSource {
  Future<GetNewsResponseModel> getAllNews({
    required int limit,
    required int offset,
  });

  Future<GetSearchedCargoItemsResponseModel> getAllCargos({
    required int limit,
    required int offset,
  });

  Future<GetSearchedCargoItemsResponseModel> getAllCargosWithoutFilter({
    required int limit,
    required int offset,
  });

  Future<GetAddressesResponseModel> getAddresses({
    required int limit,
    required int offset,
    String? searchedText,
  });

  Future<GetSearchedCargoItemsResponseModel> getSearchedCargoItems({
    required GetSearchedCargoItemsRequestModel request,
    required int limit,
    required int offset,
  });

  Future<GetCargoDetailsResponseModel> getCargoDetails({
    required String guid,
  });

  Future<CargoPointAddressesResponse> getAddressesPoint({
    required CargoPointsAddressesRequest request,
  });

  Future<GetVehicleTypesResponseModel> getVehicleTypes({
    required int limit,
    required int offset,
  });

  Future<dynamic> putOppositeOffer({
    required PutOppositeOfferRequestModel requestModel,
  });

  /// Opposite offer methods

  Future<FetchCurrencyResponse> fetchCurrency();

  Future<dynamic> postOppositeOffer({
    required String orderId,
  });

  Future<bool> createRoute({
    required CreateRouteRequest request,
  });

  Future<FetchRoutesResponse> fetchRoutes({
    required FetchRoutesRequest request,
  });

  Future<bool> deleteRoute({
    required String routeId,
  });

  Future<bool> updateRoute({
    required UpdateRouteRequest request,
  });

  Future<NotificationResponse> fetchNotifications({
    required NotificationRequest request,
  });

  Future<bool> putNotification({
    required PutNotificationRequest request,
  });

  Future<GetOrderByNotificationResponseModel> getOrderDetailsByNotification({
    required String guid,
  });

  Future<GetDetailAddressesByNotification> getAddressesByNotification({
    required GetAddressesRequestByNotification getAddressesRequest,
  });

  Future<FetchAddressPositionNotificationResponse> fetchAddressesPositionsNotification({
    required FetchAddressPositionNotificationRequest fetchAddressPositionRequest,
  });

  Future<bool> putOrderByNotification({
    required List<String> status,
    required String orderId,
  });

  Future<bool> putFavouriteCargo({
    required PutFavouriteRequestHome request,
  });

  Future<FetchAddressPositionCargoResponse> fetchAddressesPositionsCargo({
    required FetchAddressPositionCargoRequest fetchAddressPositionRequest,
  });

  /// Filter methods

  Future<TypesCargoResponse> fetchCargoTypes();

  Future<TypesPaymentResponse> fetchPaymentTypes();

  Future<FilteredCargoResponseModel> fetchCargoFromFilter({
    required ApplyFilterRequest request,
  });
}
