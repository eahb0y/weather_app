import 'package:flutter/material.dart';
import 'package:inhetited_test/router/route_name.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
