import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/menu/app_menu_tile.widget.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppMenuTile(
          leadingIcon: Icons.home,
          title: "Dashboard",
        ),
        AppMenuTile(
          leadingIcon: Icons.router,
          title: "Router",
        ),
        AppMenuTile(
          leadingIcon: Icons.miscellaneous_services,
          title: "Services",
        ),
        AppMenuTile(
          leadingIcon: Icons.account_tree,
          title: "Middlewares",
        ),
        Spacer(),
        AppMenuTile(
          leadingIcon: Icons.settings,
          title: "Einstellungen",
        ),
        AppMenuTile(
          leadingIcon: Icons.list_alt,
          title: "Logs",
        ),
        AppMenuTile(
          leadingIcon: Icons.person,
          title: "Benutzer",
        ),
      ],
    );
  }
}
