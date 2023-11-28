import 'package:iot_home_control/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String username, String email, String password);
  Future<User> checkAuthStatus(String token);
}
