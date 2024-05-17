import 'package:flutter/material.dart';
import 'package:inhetited_test/router/app_routes.dart';
import 'package:inhetited_test/router/route_name.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      initialRoute: Routes.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: 'MediaPark',
      debugShowCheckedModeBanner: false,
    );
  }
}
