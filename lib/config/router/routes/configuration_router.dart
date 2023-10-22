import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/screens/configuration/theme/configuration_theme_screen.dart';

final configurationRoutes = <GoRoute>[
  GoRoute(
    name: ConfigurationThemeScreen.name,
    path: 'theme',
    builder: (context, state) => const ConfigurationThemeScreen(),
  ),
];
