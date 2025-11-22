import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/layouts/default_layout.dart';
import 'package:go_router_example/routes/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('Home initState, counter = $counter');
  }

  @override
  void dispose() {
    debugPrint('Home dispose, counter = $counter');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Home build, counter = $counter');

    return DefaultLayout(
      children: [
        Text('counter: $counter'),
        ElevatedButton(
          onPressed: () {
            setState(() => counter++);
          },
          child: const Text('++ counter'),
        ),

        ElevatedButton(
          onPressed: () => context.goNamed(AppRoute.private.name),
          child: const Text('Go to Private Screen (goNamed)'),
        ),

        ElevatedButton(
          onPressed: () => context.goNamed(AppRoute.private2.name),
          child: const Text('Go to Private Screen (goNamed)'),
        ),

        ElevatedButton(
          onPressed: () => context.goNamed(
            AppRoute.param.name,
            pathParameters: {'id': '123'},
          ),
          child: const Text('Go to Param Screen (goNamed)'),
        ),
      ],
    );
  }
}
