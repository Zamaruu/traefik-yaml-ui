import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';

class DashboardScreen extends StatelessScreenWidget {
  const DashboardScreen({
    super.key,
    required super.argument,
  });

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: "Dashboard",
      body: Center(
        child: Text("Dashboard Content"),
      ),
    );
  }
}
