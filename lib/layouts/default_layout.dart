import 'package:flutter/material.dart';
import 'package:go_router_example/routes/app_route.dart';

class DefaultLayout extends StatelessWidget {
  final List<Widget>? children;

  const DefaultLayout({
    super.key,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(appRoute.state.name!.toUpperCase()),
            if (children != null && children!.isNotEmpty) ...children!,
          ],
        ),
      ),
    );
  }
}
