import 'package:flutter/material.dart';
import 'package:frontend/router.dart';
import 'package:frontend/src/core/widgets/menu/app_menu_tile.widget.dart';
import 'package:go_router/go_router.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  void _navigateTo(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Column(
        children: [
          AppMenuTile(
            leadingIcon: Icons.home,
            title: "Dashboard",
            onPressed: () => _navigateTo(context, AppRouter.kDashboardRoute),
          ),
          const AppMenuTile(
            leadingIcon: Icons.router,
            title: "Router",
          ),
          const AppMenuTile(
            leadingIcon: Icons.miscellaneous_services,
            title: "Services",
          ),
          const AppMenuTile(
            leadingIcon: Icons.account_tree,
            title: "Middlewares",
          ),
          const Spacer(),
          const AppMenuTile(
            leadingIcon: Icons.settings,
            title: "Einstellungen",
          ),
          const AppMenuTile(
            leadingIcon: Icons.list_alt,
            title: "Logs",
          ),
          const AppMenuTile(
            leadingIcon: Icons.person,
            title: "Benutzer",
          ),
        ],
      ),
    );
  }
}
