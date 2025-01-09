import 'package:equatable/equatable.dart';

import '../../data/models/get_trailer_types_response_model.dart';

class GetTrailerTypesResponseEntity extends Equatable {
  const GetTrailerTypesResponseEntity({
    required this.count,
    required this.trailerTypes,
  });

  final int count;
  final List<TrailerTypeItem> trailerTypes;

  @override
  List<Object?> get props => [trailerTypes];
}

class TrailerTypeItem {
  String? guid;
  String? name;

  TrailerTypeItem({
    this.guid,
    this.name,
  });
}

extension GetTrailerTypesResponseEntityX on GetTrailerTypesResponseModel {
  GetTrailerTypesResponseEntity toEntity() => GetTrailerTypesResponseEntity(
        count: data?.data?.count ?? 0,
        trailerTypes: data?.data?.response
                ?.map(
                  (trailer) => TrailerTypeItem(
                    guid: trailer.guid ?? '',
                    name: trailer.name ?? '',
                  ),
                )
                .toList() ??
            [],
      );
}
