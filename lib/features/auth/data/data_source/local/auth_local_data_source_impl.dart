part of 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.box);

  final Box<dynamic> box;
}
