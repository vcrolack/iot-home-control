import 'package:flutter/material.dart';

class ConfigurationThemeItem {
  final int id;
  final String title;
  final String subtitle;
  final IconData icon;

  const ConfigurationThemeItem(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.icon});
}

const List<ConfigurationThemeItem> configurationThemeItems = [
  ConfigurationThemeItem(
      id: 1,
      title: 'Aspect',
      subtitle: 'Change the brightness',
      icon: Icons.brightness_high),
  ConfigurationThemeItem(
      id: 2,
      title: 'Color',
      subtitle: 'Change the color theme',
      icon: Icons.colorize_outlined),
];
