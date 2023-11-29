import 'package:iot_home_control/domain/datasources/auth/auth_datasource.dart';
import 'package:iot_home_control/domain/entities/user.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<User> checkAuthStatus(String token) {
    return datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<User> register(String username, String email, String password) {
    return datasource.register(username, email, password);
  }
}
