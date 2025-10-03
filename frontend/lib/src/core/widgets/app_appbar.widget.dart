import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:frontend/src/core/widgets/app_traefik_logo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final Color appBarColor;

  final bool canOpenDrawer;

  const AppAppBar({
    super.key,
    required this.title,
    this.canOpenDrawer = false,
    this.appBarColor = const Color(0xff24a1c1),
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(
        child: Tooltip(
          message: canOpenDrawer ? "App Menü öffnen" : "Traefik Logo",
          child: GestureDetector(
            onTap: canOpenDrawer
                ? () {
                    Scaffold.of(context).openDrawer();
                  }
                : null,
            child: const TraefikLogo(),
          ),
        ),
      ),
      title: SelectableText(title),
      backgroundColor: appBarColor,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.light_mode_outlined),
          tooltip: "Heller- / Dunkler Modus",
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh),
          tooltip: "Zurücksetzen der lokalen Änderungen und laden der Config vom Server",
        ),
        IconButton(
          onPressed: () {
            final githubUri = Uri.parse("https://github.com/Zamaruu");
            launchUrl(githubUri);
          },
          icon: const Icon(MdiIcons.github),
          tooltip: "Mein Github",
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout),
          tooltip: "Abmelden",
        ),
      ],
    );
  }
}
