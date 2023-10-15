import 'package:go_router/go_router.dart';
import 'package:iot_home_control/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/register', routes: [
  GoRoute(
    name: LoginScreen.name,
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: RegisterScreen.name,
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  )
]);
