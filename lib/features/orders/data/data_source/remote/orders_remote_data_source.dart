import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../../../../router/app_routes.dart';
import '../../models/address_position/fetch_address_position_request.dart';
import '../../models/address_position/fetch_address_position_response.dart';
import '../../models/get_addresses_request.dart';
import '../../models/get_addresses_response.dart';
import '../../models/get_order_details_response_model.dart';
import '../../models/get_orders_response_model.dart';
import '../../models/post_rating_review_request_model.dart';

part 'orders_remote_data_source_impl.dart';

abstract class OrdersRemoteDataSource {
  Future<GetOrdersResponseModel> getOrders({
    required List<String> ordersType,
    required int limit,
    required int offset,
  });

  Future<GetOrderDetailsResponseModel> getOrderDetails({
    required String guid,
  });

  Future<dynamic> putOrderStatuses({
    required List<String> statuses,
    required String orderId,
  });

  Future<dynamic> postRatingReviews({
    required RatingReviewRequestModel request,
  });

  Future<dynamic> putOrder({
    required List<String> status,
    List<String>? whoCancellation,
    required String orderId,
    required String carType,
  });

  Future<dynamic> acceptUser({required String provisions});

  Future<GetDetailAddressesResponse> getAddresses({
    required GetAddressesRequest getAddressesRequest,
  });

  Future<FetchAddressPositionResponse> fetchAddressesPositions({
    required FetchAddressPositionRequest fetchAddressPositionRequest,
  });

  Future<bool> putNewOrderStatuses({
    required String orderId,
    required num acceptedOffers,
  });
}
