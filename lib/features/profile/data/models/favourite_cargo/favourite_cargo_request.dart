import '../../../../../constants/constants.dart';
import '../../../../../router/app_routes.dart';

class FavouriteCargoRequest {
  FavouriteCargoRequest({
    this.usersIds,
    this.withRelations,
  });

  FavouriteCargoRequest.fromJson(Map json) {
    usersIds = json['users_ids'];
    withRelations = json['with_relations'];
  }

  String? usersIds;
  bool? withRelations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['with_relations'] = withRelations;
    map['cargo_type'] = ['cargo'];
    map['project-id'] = Constants.projectId;
    map['vehicle_type_id'] = localSource.vehicleId;
    map['order_status'] = ['active'];

    return map;
  }
}
