import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_home_control/config/constants/auth_status.dart';
import 'package:iot_home_control/config/router/app_router_notifier.dart';
import 'package:iot_home_control/config/router/routes/routes.dart';
import 'package:iot_home_control/presentation/screens/Auth/check_auth_status_screen.dart';
import 'package:iot_home_control/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    initialLocation: '/checking',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        name: CheckAuthStatusScreen.name,
        path: '/checking',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        name: HomeScreen.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          name: 'auth',
          path: '/auth',
          builder: (context, state) => const SizedBox.shrink(),
          routes: authRoutes),
      GoRoute(
          name: ConfigurationScreen.name,
          path: '/configuration',
          builder: (context, state) => const ConfigurationScreen(),
          routes: configurationRoutes),
      GoRoute(
        name: DevicesScreen.name,
        path: '/devices',
        builder: (context, state) => const DevicesScreen(),
      ),
      GoRoute(
        name: AnalysisDataScreen.name,
        path: '/analysis',
        builder: (context, state) => const AnalysisDataScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/checking' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/auth/login' || isGoingTo == '/auth/register') {
          return null;
        }

        return '/auth/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/auth/login' ||
            isGoingTo == '/auth/register' ||
            isGoingTo == '/checking') {
          return '/';
        }
      }

      return null;
    },
  );
});
