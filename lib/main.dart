import 'package:flutter/material.dart';
import 'package:go_router_example/routes/app_route.dart';

void main() {
  runApp(const GoRouterExampleApp());
}

class GoRouterExampleApp extends StatelessWidget {
  const GoRouterExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,
    );
  }
}
