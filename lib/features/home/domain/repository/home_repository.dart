import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/local/home_local_data_source.dart';
import '../../data/data_source/remote/home_remote_data_source.dart';
import '../../data/models/address_position/address_position_cargo_request.dart';
import '../../data/models/apply_filter/apply_filter_request.dart';
import '../../data/models/cargo_details/cargo_addresses_point_request.dart';
import '../../data/models/favourites/put_favourite_request_home.dart';
import '../../data/models/notification/get_order_by_notification/fetch_address_position_notification_request.dart';
import '../../data/models/notification/get_order_by_notification/request_addresses_by_notification.dart';
import '../../data/models/notification/notification_request.dart';
import '../../data/models/notification/put_notification_request.dart';
import '../../data/models/opposite_offer/put_opposite_offer_request_model.dart';
import '../../data/models/route/create_route/create_route_request.dart';
import '../../data/models/route/fetch_routes/fetch_routes_request.dart';
import '../../data/models/route/update_route/update_route_request.dart';
import '../entities/cargo_details/address_position_cargo_entity.dart';
import '../entities/cargo_details/cargo_addresses_point_entity.dart';
import '../entities/cargo_details/get_cargo_details_response_entity.dart';
import '../entities/news/get_news_response_entity.dart';
import '../entities/notification/get_order_by_notification_entity/fetch_address_positions_notification_entity.dart';
import '../entities/notification/get_order_by_notification_entity/get_addresses_notification_entity.dart';
import '../entities/notification/get_order_by_notification_entity/get_order_by_notification_entity.dart';
import '../entities/notification/notification_response_entity.dart';
import '../entities/opposite_offer/fetch_currency_entity.dart';
import '../entities/opposite_offer/get_vehicle_types_response_entity.dart';
import '../entities/routes/fetch_routes_entity.dart';
import '../entities/search/get_addresses_response_entity.dart';
import '../entities/search/get_searched_cargo_items_request_entity.dart';
import '../entities/search/get_searched_cargo_items_response_entity.dart';
import '../entities/types_cargo/types_cargo_entity.dart';
import '../entities/types_payment/types_payment_entity.dart';

part '../../data/repository/home_repository_impl.dart';

sealed class HomeRepository {
  Future<Either<Failure, GetNewsResponseEntity>> getAllNews({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, GetAddressesResponseEntity>> getAddresses({
    required int limit,
    required int offset,
    String? searchedText,
  });

  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getSearchedCargoItems({
    required GetSearchedCargoItemsRequestEntity requestEntity,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, GetCargoDetailsResponseEntity?>> getCargoDetails({
    required String guid,
  });

  Future<Either<Failure, CargoAddressesPointEntity>> getAddressesPoint({
    required List<String> guids,
  });

  Future<Either<Failure, FetchAddressesPositionsNotificationEntity>> fetchAddressPositionsNotification({
    required String guid,
  });

  Future<Either<Failure, FetchAddressesPositionsCargoEntity>> fetchAddressPositionsCargo({
    required String guid,
  });

  Future<Either<Failure, bool>> putOrder({
    required String orderId,
    required List<String> status,
  });

  Future<Either<Failure, GetVehicleTypesResponseEntity>> getVehicleTypes({
    required int limit,
    required int offset,
  });

  /// Opposite offer methods

  Future<Either<Failure, FetchCurrencyEntity>> fetchCurrency();

  Future<Either<Failure, dynamic>> putOppositeOffer({
    required PutOppositeOfferRequestModel request,
  });

  Future<Either<Failure, dynamic>> postOppositeOffer({
    required String orderId,
  });

  Future<Either<Failure, bool>> createRoute({
    required CreateRouteRequest request,
  });

  Future<Either<Failure, FetchRoutesEntity>> fetchRoutes({
    required FetchRoutesRequest request,
  });

  Future<Either<Failure, bool>> deleteRoute({
    required String routeId,
  });

  Future<Either<Failure, bool>> updateRoute({
    required UpdateRouteRequest request,
  });

  Future<Either<Failure, NotificationResponseEntity>> fetchNotifications({
    required NotificationRequest request,
  });

  Future<Either<Failure, bool>> putNotification({
    required PutNotificationRequest request,
  });

  Future<Either<Failure, GetOrderByNotificationEntity?>> getOrderDetailsByNotification({
    required String guid,
  });

  Future<Either<Failure, GetDetailAddressesByNotificationEntity>> getAddressesDetailByNotification({
    required String guid,
  });

  Future<Either<Failure, bool>> putFavouriteCargo({
    required PutFavouriteRequestHome request,
  });

  /// Filter methods

  Future<Either<Failure, TypesCargoEntity>> fetchTypesCargo();

  Future<Either<Failure, TypesPaymentEntity>> fetchTypesPayment();

  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> fetchCargoFromFilter({
    required ApplyFilterRequest request,
  });

  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getAllCargoItems({
    required int limit,
    required int offset,
  });

  Future<Either<Failure, GetSearchedCargoItemsResponseEntity>> getAllCargoItemsWithoutFilter({
    required int limit,
    required int offset,
  });
}
