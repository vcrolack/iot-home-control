import 'package:isar/isar.dart';

part 'user_preferences.g.dart';

@collection
class UserPreferences {
  Id? isarId;

  bool darkMode;
  int colorTheme;
  bool enableNotifications;

  UserPreferences(
      {required this.darkMode,
      required this.colorTheme,
      required this.enableNotifications});

  UserPreferences.initial(
      {required this.darkMode,
      required this.colorTheme,
      required this.enableNotifications});
}
