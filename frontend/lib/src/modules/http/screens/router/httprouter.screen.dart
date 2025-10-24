import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_ui/router.dart';
import 'package:traefik_frontend_ui/src/core/extensions/sdk/context.extensions.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:traefik_frontend_ui/src/modules/http/provider/httprouter.provider.dart';
import 'package:traefik_frontend_ui/src/modules/http/screens/router/httprouteredit.screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HttpRouterScreen extends ConsumerScreenWidget {
  const HttpRouterScreen({super.key, required super.argument});

  void _openRouterEditScreen(BuildContext context, String? routerName) {
    final editRouterArgument = HttpRouterEditArgument(routerName: routerName);

    context.pushRoute(
      AppRouter.kHttpRoutersEditRoute,
      argument: editRouterArgument,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routers = ref.watch(httpRouterProvider);

    return AppScaffold(
      title: "HTTP Router",
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: const Text("Erstellen"),
                  icon: const Icon(Icons.add_circle),
                ),
                TextButton.icon(
                  onPressed: null,
                  label: const Text("Auswahl löschen"),
                  icon: const Icon(Icons.delete_forever),
                ),
                TextButton.icon(
                  onPressed: () {
                    final uri = Uri.parse("https://doc.traefik.io/traefik/reference/routing-configuration/http/router/rules-and-priority/");
                    launchUrl(uri);
                  },
                  label: const Text("Dokumentation"),
                  icon: const Icon(Icons.article_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: routers.length,
              itemBuilder: (context, index) {
                final router = routers[index];
                return ListTile(
                  title: Text(router.name),
                  subtitle: Text(router.rule ?? "<keine Rule>"),
                  onTap: () => _openRouterEditScreen(context, router.name),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
