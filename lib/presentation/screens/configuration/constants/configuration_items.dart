import 'package:flutter/material.dart';

class ConfigurationItem {
  final int id;
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const ConfigurationItem(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const List<ConfigurationItem> configurationItems = [
  ConfigurationItem(
      id: 1,
      title: 'Application',
      subtitle: 'Change app configuration',
      link: '/configuration/application',
      icon: Icons.app_settings_alt_outlined),
  ConfigurationItem(
      id: 2,
      title: 'Account',
      subtitle: 'Change account info',
      link: '/configuration/account',
      icon: Icons.person_outlined),
  ConfigurationItem(
      id: 3,
      title: 'Notifications',
      subtitle: 'Personalize your notifications',
      link: '/configuration/notifications',
      icon: Icons.notifications_outlined),
  ConfigurationItem(
      id: 4,
      title: 'Theme',
      subtitle: 'Personalize your team',
      link: '/configuration/theme',
      icon: Icons.palette_outlined),
  ConfigurationItem(
      id: 5,
      title: 'Log out',
      subtitle: 'See you soon!',
      link: '/auth/login',
      icon: Icons.logout_outlined)
];
