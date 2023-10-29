import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/config/theme/app_theme.dart';
import 'package:iot_home_control/config/theme/colors_list.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';
import 'package:iot_home_control/presentation/providers/providers.dart';

// final darkModeProvider = StateProvider((ref) => (true));

final colorListProvider = StateProvider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  final storageRepository = ref.watch(localStorageRepositoryProvider);
  return ThemeNotifier(storageRepository, ref);
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  final LocalStorageRepository storageRepository;
  final Ref ref;

  ThemeNotifier(this.storageRepository, this.ref) : super(AppTheme()) {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final storageRepository = ref.read(localStorageRepositoryProvider);
    final userPreferences = await storageRepository.getUserPreferences();

    state = AppTheme(
      selectedColor: userPreferences.colorTheme,
      isDarkMode: userPreferences.darkMode,
    );
  }

  void toggleDarkMode() async {
    UserPreferences preferences = await storageRepository.getUserPreferences();

    preferences.darkMode = !state.isDarkMode;
    await storageRepository.savePreferences(preferences);

    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) async {
    UserPreferences preferences = await storageRepository.getUserPreferences();

    preferences.colorTheme = colorIndex;
    await storageRepository.savePreferences(preferences);

    state = state.copyWith(selectedColor: colorIndex);
  }
}
