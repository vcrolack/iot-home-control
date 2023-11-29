import 'package:iot_home_control/domain/datasources/local_storage_datasource.dart';
import 'package:iot_home_control/domain/entities/user.dart';
import 'package:iot_home_control/domain/entities/user_preferences.dart';
import 'package:iot_home_control/infraestructure/errors/errors.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarLocalStorageDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarLocalStorageDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([UserPreferencesSchema, UserSchema],
          inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> savePreferences(UserPreferences preferences) async {
    final isar = await db;

    isar.writeTxnSync(() {
      if (preferences.isarId == null) {
        isar.userPreferences.putSync(preferences);
        return;
      }

      isar.userPreferences.putSync(preferences);
    });
  }

  @override
  Future<UserPreferences> getUserPreferences() async {
    final isar = await db;

    final UserPreferences? preferences =
        await isar.userPreferences.where().findFirst();
    return preferences ??
        UserPreferences.initial(
            darkMode: true, colorTheme: 0, enableNotifications: true);
  }

  @override
  Future<User> getLoginUser() async {
    final isar = await db;

    final User? user = await isar.users.where().findFirst();

    if (user == null) throw UserNotFoundException('User not found');

    return user;
  }

  @override
  Future<bool> removeLoginUser() async {
    final isar = await db;

    final bool isDeleted = await isar.users.where().deleteFirst();

    return isDeleted;
  }

  @override
  Future<void> saveLoginUser(User user) async {
    final isar = await db;

    try {
      isar.writeTxnSync(() {
        if (user.isarId == null) {
          isar.users.putSync(user);
          return;
        }

        isar.users.putSync(user);
      });
    } on IsarError catch (e) {
      print('Error en la transacción de Isar: $e');
      throw DatabaseOperationException('Database transactions failed');
    }
  }
}
