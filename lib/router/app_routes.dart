import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inhetited_test/dependency_injection.dart';
import 'package:inhetited_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:inhetited_test/features/home/presentation/pages/home_page.dart';
import 'package:inhetited_test/features/initial/presentation/arguments/initial_arguments.dart';
import 'package:inhetited_test/features/initial/presentation/pages/initial_page.dart';
import 'package:inhetited_test/router/route_name.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();

final Chuck chuck = Chuck(
  showNotification: true,
  showInspectorOnShake: false,
  darkTheme: false,
  navigatorKey: rootNavigatorKey,
);

class AppRoutes {
  AppRoutes._();

  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   if (kDebugMode) {
  //     print("route : ${settings.name}");
  //   }
  //
  //   switch (settings.name) {
  //     case Routes.initial:
  //       return MaterialPageRoute(builder: (_) => const InitialPage());
  //     case Routes.home:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider<HomeBloc>(
  //           create: (_) => sl<HomeBloc>(),
  //           child: const HomePage(),
  //         ),
  //       );
  //     default:
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider<HomeBloc>(
  //           create: (context) => sl<HomeBloc>(),
  //           child: const HomePage(),
  //         ),
  //       );
  //   }
  // }

  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: Routes.home,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.initial,
        builder: (BuildContext context, GoRouterState state) {
          return const InitialPage();
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider<HomeBloc>(
            create: (_) => sl<HomeBloc>(),
            child: HomePage(
              access: state.extra is InitialArguments
                  ? state.extra as InitialArguments
                  : null,
            ),
          );
        },
      ),
    ],
  );
}
