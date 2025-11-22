import 'package:flutter/material.dart';
import 'package:go_router_example/layouts/default_layout.dart';
import 'package:go_router_example/routes/app_router.dart';

class ParamScreen extends StatelessWidget {
  const ParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        Text(AppRouter.appRoute.state.pathParameters.toString()),
      ],
    );
  }
}
