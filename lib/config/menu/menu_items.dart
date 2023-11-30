import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/presentation/providers/auth/auth_provider.dart';

typedef ContextCallback = void Function(BuildContext context);

class MenuItem {
  final String title;
  final String subtitle;
  final String? link;
  final IconData icon;
  final Function(BuildContext, WidgetRef)? onTap;

  MenuItem({
    required this.title,
    required this.subtitle,
    this.link,
    required this.icon,
    this.onTap,
  });
}

/* LIST ITEM MENU */

final List<MenuItem> appMenuItems = [
  MenuItem(
    title: "Home",
    subtitle: "General view",
    link: "/",
    icon: Icons.home_outlined,
  ),
  MenuItem(
    title: "Categories",
    subtitle: "Check our categories",
    link: "/categories",
    icon: Icons.category_outlined,
  ),
  MenuItem(
      title: "Devices",
      subtitle: "Take a look your devices",
      link: '/devices',
      icon: Icons.device_hub_outlined),
  MenuItem(
      title: "Analysis",
      subtitle: "See your behavior",
      link: '/analysis',
      icon: Icons.data_thresholding_outlined),
  MenuItem(
      title: "Configuration",
      subtitle: "Change your preferences",
      link: "/configuration",
      icon: Icons.settings_outlined),
  MenuItem(
    title: "Log out",
    subtitle: "",
    onTap: (context, ref) {
      ref.read(authProvider.notifier).logout();
    },
    icon: Icons.logout_outlined,
  )
];
