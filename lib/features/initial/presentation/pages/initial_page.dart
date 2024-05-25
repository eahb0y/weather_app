import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:inhetited_test/features/initial/presentation/arguments/initial_arguments.dart';
import 'package:inhetited_test/geolocation_servise.dart';
import 'package:inhetited_test/router/route_name.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {

    if (context.mounted) {
      context.goNamed(
        Routes.home,
        extra: InitialArguments(access: true),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
