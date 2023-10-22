import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/config/router/app_router.dart';
import 'package:iot_home_control/config/theme/app_theme.dart';
import 'package:iot_home_control/presentation/providers/theme/theme_provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
        routerConfig: appRouter,
        // routeInformationParser: appRouter.routeInformationParser,
        // routerDelegate: appRouter.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: 'IoT Home Control',
        theme: appTheme.getTheme());
  }
}
