import 'package:go_router/go_router.dart';
import 'package:go_router_example/screens/home_screen.dart';
import 'package:go_router_example/screens/splash_screen.dart';

enum AppRoute {
  splash,
  home,
}

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      pageBuilder: (context, state) => NoTransitionPage(
        child: HomeScreen(),
      ),
    ),
  ],
);
