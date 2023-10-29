import 'package:iot_home_control/domain/datasources/datasources.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<void> savePreferences(UserPreferences preferences) {
    return datasource.savePreferences(preferences);
  }

  @override
  Future<UserPreferences> getUserPreferences() {
    return datasource.getUserPreferences();
  }
}
