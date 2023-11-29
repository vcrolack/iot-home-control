import 'package:iot_home_control/domain/entities/entities.dart';

abstract class LocalStorageDatasource {
  Future<void> savePreferences(UserPreferences preferences);
  Future<UserPreferences> getUserPreferences();
  Future<void> saveLoginUser(User user);
  Future<User> getLoginUser(int userId);
  Future<bool> removeLoginUser(int userId);
}
