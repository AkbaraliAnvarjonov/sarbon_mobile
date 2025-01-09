import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/main_remote_data_source.dart';
import '../../data/model/tracking/tracking_request.dart';

part '../../data/repository/main_repository_impl.dart';

sealed class MainRepository {
  Future<Either<Failure, bool>> putTracking({
    required TrackingForApiRequest request,
  });
}
