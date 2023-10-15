import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color.fromARGB(255, 97, 248, 241),
      brightness: Brightness.light,
      fontFamily: 'roboto',
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 45),
          titleSmall: TextStyle(fontSize: 15)));
}
