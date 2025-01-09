import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/local/orders_local_data_source.dart';
import '../../data/data_source/remote/orders_remote_data_source.dart';
import '../../data/models/address_position/fetch_address_position_request.dart';
import '../../data/models/get_addresses_request.dart';
import '../entities/address_positions/fetch_address_positions_entity.dart';
import '../entities/get_addresses_response_entity.dart';
import '../entities/get_order_details_response_entity.dart';
import '../entities/get_orders_response_entity.dart';
import '../entities/post_rating_review_request_entity.dart';

part '../../data/repository/orders_repository_impl.dart';

sealed class OrdersRepository {
  Future<Either<Failure, GetOrdersResponseEntity>> getOrders({
    required List<String> ordersType,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, GetOrderDetailsResponseEntity?>> getOrderDetails({
    required String guid,
  });

  Future<Either<Failure, dynamic>> putOrderStatuses({
    required List<String> statuses,
    required String orderId,
  });

  Future<Either<Failure, dynamic>> postRatingReviews({
    required RatingReviewsRequestEntity requestEntity,
  });

  Future<Either<Failure, dynamic>> putOrder({
    required String orderId,
    required String carType,
    List<String>? whoCancellation,
    required List<String> status,

  });

  Future<Either<Failure, GetDetailAddressesListResponseEntity>> getAddresses({
    required List<String> guids,
  });

  Future<Either<Failure, FetchAddressesPositionsListEntity>>
      fetchAddressPositions({
    required String guid,
  });

  Future<Either<Failure, bool>> putNewOrderStatuses({
    required String orderId,
    required num acceptedOffers,
  });
}
