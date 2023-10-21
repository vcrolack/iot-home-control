import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef ContextCallback = void Function(BuildContext context);

class MenuItem {
  final String title;
  final String subtitle;
  final String? link;
  final IconData icon;
  final ContextCallback? onTap;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      this.link,
      required this.icon,
      this.onTap});
}

/* LIST ITEM MENU */

final List<MenuItem> appMenuItems = [
  const MenuItem(
    title: "Home",
    subtitle: "General view",
    link: "/",
    icon: Icons.home_outlined,
  ),
  const MenuItem(
    title: "Categories",
    subtitle: "Check our categories",
    link: "/categories",
    icon: Icons.category_outlined,
  ),
  const MenuItem(
      title: "Devices",
      subtitle: "Take a look your devices",
      link: '/devices',
      icon: Icons.device_hub_outlined),
  const MenuItem(
      title: "Configuration",
      subtitle: "Change your preferences",
      link: "/configuration",
      icon: Icons.settings_outlined),
  MenuItem(
    title: "Log out",
    subtitle: "",
    onTap: (context) {
      final goRouter = GoRouter.of(context);
      goRouter.pushReplacement('/auth/login');
    },
    icon: Icons.logout_outlined,
  )
];
