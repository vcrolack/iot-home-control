import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/config/theme/app_theme.dart';
import 'package:iot_home_control/config/theme/colors_list.dart';

final darkModeProvider = StateProvider((ref) => (true));

final colorListProvider = StateProvider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
