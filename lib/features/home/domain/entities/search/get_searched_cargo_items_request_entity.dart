import 'package:equatable/equatable.dart';

import '../../../data/models/search/get_searched_cargo_items_request_model.dart';

class GetSearchedCargoItemsRequestEntity extends Equatable {
  final List<String>? addressId;
  final List<String>? addressId2;
  final LoadTimeEntity? loadTime;
  final List<String>? orderStatus;

  const GetSearchedCargoItemsRequestEntity({
    this.addressId,
    this.addressId2,
    this.loadTime,
    this.orderStatus,
  });

  @override
  List<Object?> get props => [
        addressId,
        addressId2,
        loadTime,
        orderStatus,
      ];
}

class LoadTimeEntity {
  final String? gte;
  final String? lt;

  const LoadTimeEntity({
    this.gte,
    this.lt,
  });
}

extension GetSearchedCargoItemsRequestEntityX
    on GetSearchedCargoItemsRequestEntity {
  GetSearchedCargoItemsRequestModel get toModel =>
      GetSearchedCargoItemsRequestModel(
        addressId: addressId,
        addressId2: addressId2,
        loadTime: LoadTime(
          gte: loadTime?.gte,
          lt: loadTime?.lt,
        ),
        orderStatus: orderStatus,
      );
}
