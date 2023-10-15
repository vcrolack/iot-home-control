import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: LoginScreen.name,
      path: '/',
      builder: (context, state) => const LoginScreen(),
      routes: const []),
]);
