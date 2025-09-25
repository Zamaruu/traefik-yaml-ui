import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_traefik_logo.widget.dart';

class AppScaffold extends StatelessWidget {
  final String title;

  final Color appBarColor;

  const AppScaffold({
    super.key,
    required this.title,
    this.appBarColor = const Color(0xff24a1c1),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const TraefikLogo(),
        title: Text(title),
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
