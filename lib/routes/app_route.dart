import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/screens/home_screen.dart';
import 'package:go_router_example/screens/profile_screen.dart';
import 'package:go_router_example/screens/setting_screen.dart';
import 'package:go_router_example/screens/splash_screen.dart';

enum AppRoute {
  splash,
  home,
  profile,
  setting,
  login,
  private,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _profileNavigatorKey = GlobalKey<NavigatorState>();
final _settingNavigatorKey = GlobalKey<NavigatorState>();

final appRoute = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state, navigationShell) => NoTransitionPage(
        child: BottomNavigationScaffold(
          navigationShell: navigationShell,
        ),
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              name: AppRoute.home.name,
              pageBuilder: (context, state) => NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavigatorKey,
          routes: [
            GoRoute(
              path: '/profile',
              name: AppRoute.profile.name,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingNavigatorKey,
          routes: [
            GoRoute(
              path: '/setting',
              name: AppRoute.setting.name,
              builder: (context, state) => SettingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class BottomNavigationScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) async => navigationShell.goBranch(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
