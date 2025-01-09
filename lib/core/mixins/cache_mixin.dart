import '../../router/app_routes.dart';

mixin CacheMixin {
  Future<void> setUserInfo({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String token,
  }) async {
    await localSource.setFullName(firstName);
    await localSource.setLastName(lastName);
    await localSource.setEmail(email);
    await localSource.setPassword(password);
    await localSource.setAccessToken(token);
  }
}
