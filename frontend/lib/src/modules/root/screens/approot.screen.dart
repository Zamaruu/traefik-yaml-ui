import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';

class AppRoot extends StatelessScreenWidget {
  const AppRoot({super.key, required super.argument});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Traefik-UI",
    );
  }
}
