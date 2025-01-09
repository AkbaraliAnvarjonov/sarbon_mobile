import '../either/either.dart';
import '../error/exceptions.dart';
import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
