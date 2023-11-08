import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/entities.dart';

final Map<String, IconData> _iconMapping = {
  'pantry': Icons.kitchen_outlined,
  'light': Icons.light_outlined,
  'curtain': Icons.curtains_outlined,
};

final Map<String, Color> _colorMapping = {
  'pantry': const Color(0xffB34949),
  'light': const Color(0xff459FB3),
  'curtain': const Color(0xffBDAB4A)
};

class DeviceViewModel {
  final String id;
  final String name;
  final String description;
  final bool state;
  final IconData icon;
  final Color color;

  DeviceViewModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.state,
      required this.icon,
      required this.color});

  factory DeviceViewModel.fromDevice(Device device) {
    IconData icon = getIconForDeviceType(device.type);
    Color color = getColorForDeviceType(device.type);

    return DeviceViewModel(
        id: device.id,
        name: device.name,
        description: device.description,
        state: device.state,
        icon: icon,
        color: color);
  }

  static IconData getIconForDeviceType(String type) =>
      _iconMapping[type] ?? Icons.question_mark;

  static Color getColorForDeviceType(String type) =>
      _colorMapping[type] ?? Colors.white;
}
