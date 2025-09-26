import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:frontend/src/core/widgets/app_traefik_logo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final Color appBarColor;

  const AppAppBar({
    super.key,
    required this.title,
    this.appBarColor = const Color(0xff24a1c1),
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const TraefikLogo(),
      title: Text(title),
      backgroundColor: appBarColor,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            final githubUri = Uri.parse("https://github.com/Zamaruu");
            launchUrl(githubUri);
          },
          icon: const Icon(MdiIcons.github),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}
