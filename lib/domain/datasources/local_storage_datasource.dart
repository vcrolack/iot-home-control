import 'package:iot_home_control/domain/entities/entities.dart';

abstract class LocalStorageDatasource {
  Future<void> savePreferences(UserPreferences preferences);
  Future<UserPreferences> getUserPreferences();
}
