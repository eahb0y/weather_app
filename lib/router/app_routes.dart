import 'package:flutter/material.dart';
import 'package:chuck_interceptor/chuck.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

final Chuck chuck = Chuck(
  showNotification: true,
  showInspectorOnShake: false,
  darkTheme: false,
  navigatorKey: rootNavigatorKey,
);