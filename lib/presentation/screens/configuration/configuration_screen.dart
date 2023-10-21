import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/screens/configuration/constants/configuration_items.dart';

class ConfigurationScreen extends StatelessWidget {
  static const name = 'configuration-screen';

  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Configuration')),
      body: ListView.builder(
          itemCount: configurationItems.length,
          itemBuilder: (context, index) {
            final configurationItem = configurationItems[index];
            return ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: colors.primary,
              ),
              title: Text(configurationItem.title),
              subtitle: Text(configurationItem.subtitle),
              leading: Icon(
                configurationItem.icon,
                color: colors.primary,
              ),
              onTap: () => context.push(configurationItem.link),
            );
          }),
    );
  }
}
