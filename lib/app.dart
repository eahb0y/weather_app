import 'package:flutter/material.dart';
import 'package:inhetited_test/router/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,

      title: 'MediaPark',
      debugShowCheckedModeBanner: false,
    );
  }
}
