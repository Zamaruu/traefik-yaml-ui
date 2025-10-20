import 'package:flutter/material.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';

class ErrorScreen extends StatelessScreenWidget {
  const ErrorScreen({super.key, required super.argument});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Error",
      body: Placeholder(),
    );
  }
}
