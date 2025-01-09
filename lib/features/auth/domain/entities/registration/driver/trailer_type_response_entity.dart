import 'package:equatable/equatable.dart';

import '../../../../data/models/login/get_companies_response_model.dart';
import '../../../../data/models/registration/driver/trailer_type_response.dart';

class TrailerTypeResponseEntity extends Equatable {
  const TrailerTypeResponseEntity({
    this.trailerTypes,
  });

  final List<TrailerTypeItem>? trailerTypes;

  @override
  List<Object?> get props => [trailerTypes];
}

class TrailerTypeItem {
  String? fullName;
  String? guid;

  TrailerTypeItem({
    this.fullName,
    this.guid,
  });
}

extension TrailerTypeResponseEntityX on List<TrailerTypeResponse> {
  TrailerTypeResponseEntity toEntity() => TrailerTypeResponseEntity(
        trailerTypes: map(
          (trailer) => TrailerTypeItem(
            fullName: trailer.name,
            guid: trailer.guid,
          ),
        ).toList(),
      );
}
