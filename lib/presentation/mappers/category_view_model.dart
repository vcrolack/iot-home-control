import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/entities.dart';

final Map<String, IconData> _iconMapping = {
  'pantries': Icons.kitchen_outlined,
  'lights': Icons.light_outlined,
  'curtains': Icons.curtains_outlined,
};

final Map<String, Color> _colorMapping = {
  'pantries': const Color(0xffB34949),
  'lights': const Color(0xff459FB3),
  'curtains': const Color(0xffBDAB4A)
};

class CategoryViewModel {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color color;
  final BuildContext? context;

  const CategoryViewModel(
      {this.context,
      required this.id,
      required this.name,
      required this.description,
      required this.icon,
      required this.color});

  factory CategoryViewModel.fromCategory(
      Category category, BuildContext context) {
    IconData icon = getIconForCategory(category.name);
    Color color = getColorForCategory(category.name, context);

    return CategoryViewModel(
        id: category.id,
        name: category.name,
        description: category.description,
        icon: icon,
        color: color);
  }

  static IconData getIconForCategory(String name) =>
      _iconMapping[name] ?? Icons.question_mark;

  static Color getColorForCategory(String name, context) =>
      _colorMapping[name] ?? Theme.of(context).colorScheme.onPrimary;
}
