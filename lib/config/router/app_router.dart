import 'package:go_router/go_router.dart';
import 'package:iot_home_control/config/router/routes/routes.dart';
import 'package:iot_home_control/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      name: 'auth',
      path: '/auth',
      builder: (context, state) => const LoginScreen(),
      routes: authRoutes),
  GoRoute(
      name: ConfigurationScreen.name,
      path: '/configuration',
      builder: (context, state) => const ConfigurationScreen(),
      routes: configurationRoutes),
]);
