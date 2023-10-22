import 'package:flutter/material.dart';
import 'package:iot_home_control/config/theme/colors_list.dart';

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = true})
      : assert(selectedColor >= 0, 'Selected Color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      fontFamily: 'roboto',
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 45),
          titleSmall: TextStyle(fontSize: 15),
          displaySmall: TextStyle(fontSize: 30)));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
