import 'package:go_router/go_router.dart';
import 'package:iot_home_control/config/router/routes/auth_router.dart';
import 'package:iot_home_control/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/auth', routes: [
  GoRoute(
      name: 'auth',
      path: '/auth',
      builder: (context, state) => const LoginScreen(),
      // redirect: ((context, state) => '/auth/login'),
      routes: authRoutes),
]);
