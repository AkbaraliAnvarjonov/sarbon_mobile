import 'package:equatable/equatable.dart';

import '../../../data/models/search/get_addresses_response_model.dart';

class GetAddressesResponseEntity extends Equatable {
  const GetAddressesResponseEntity({
    required this.count,
    required this.addresses,
  });

  final int count;
  final List<AddressItemEntity> addresses;

  @override
  List<Object?> get props => [addresses];
}

class AddressItemEntity {
  String? addressId;
  String? code;
  String? guid;
  String? name;
  String? nameRu;
  String? nameEn;
  String? type;
  String? countryName;
  String? countryNameRu;
  String? countryNameEn;

  AddressItemEntity({
    this.addressId,
    this.code,
    this.guid,
    this.name,
    this.nameRu,
    this.nameEn,
    this.type,
    this.countryName,
    this.countryNameRu,
    this.countryNameEn,
  });
}

extension GetAddressesResponseEntityX on GetAddressesResponseModel {
  GetAddressesResponseEntity toEntity() => GetAddressesResponseEntity(
        count: data?.data?.count ?? 0,
        addresses: data?.data?.response
                ?.map(
                  (address) => AddressItemEntity(
                    addressId: address.addressId ?? '',
                    // code: address.code ?? '',
                    guid: address.guid ?? '',
                    name: address.name ?? '',
                    nameRu: address.nameRu ?? '',
                    nameEn: address.nameEn ?? '',
                    countryName: address.addressIdData?.name ?? '',
                    countryNameRu: address.addressIdData?.nameRu ?? '',
                    countryNameEn: address.addressIdData?.nameEn ?? '',
                    // type: (address.type?.isNotEmpty ?? false)
                    //     ? address.type?.first ?? ''
                    //     : '',
                  ),
                )
                .toList() ??
            [],
      );
}
