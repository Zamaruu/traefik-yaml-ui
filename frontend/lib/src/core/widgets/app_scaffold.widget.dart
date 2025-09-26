import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/app_appbar.widget.dart';
import 'package:frontend/src/core/widgets/app_traefik_logo.widget.dart';
import 'package:frontend/src/core/widgets/menu/app_menu.widget.dart';

class AppScaffold extends StatelessWidget {
  final String title;

  final Color appBarColor;

  final Widget body;

  final bool disableMenu;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.disableMenu = false,
    this.appBarColor = const Color(0xff24a1c1),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: title),
      body: Row(
        children: [
          if (kIsWeb && disableMenu == false)
            const SizedBox(
              width: 200,
              child: AppMenu(),
            ),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
