import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((_) {
      if (mounted) {
        isLogin
            ? context.goNamed(AppRoute.home.name)
            : context.goNamed(AppRoute.login.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
