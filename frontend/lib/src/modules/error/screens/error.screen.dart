import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';

class ErrorScreen extends StatelessScreenWidget {
  const ErrorScreen({super.key, required super.argument});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Error",
    );
  }
}
