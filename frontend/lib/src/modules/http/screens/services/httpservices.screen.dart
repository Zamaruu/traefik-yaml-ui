import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_ui/router.dart';
import 'package:traefik_frontend_ui/src/core/extensions/sdk/context.extensions.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/dialogs/dialogbase.widget.dart';
import 'package:traefik_frontend_ui/src/modules/http/provider/httpservices.provider.dart';
import 'package:traefik_frontend_ui/src/modules/http/screens/services/httpserviceedit.screen.dart';
import 'package:traefik_frontend_ui/src/modules/http/widgets/selectservicetype.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HttpServicesScreen extends ConsumerScreenWidget {
  const HttpServicesScreen({super.key, required super.argument});

  void _openServiceEditScreen(BuildContext context, String? serviceName, EHttpServiceType type) {
    final editRouterArgument = HttpServiceEditArgument(
      serviceName: serviceName,
      serviceType: type,
    );

    context.pushRoute(
      AppRouter.kHttpServicesEditRoute,
      argument: editRouterArgument,
    );
  }

  void _createNewService(BuildContext context) async {
    final type = await showDialog(
      context: context,
      builder: (context) => const DialogBase(
        title: "Neuer Service",
        body: SelectHttpServiceType(),
      ),
    );

    if (type != null && context.mounted) {
      _openServiceEditScreen(context, null, type);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(httpServicesProvider);

    return AppScaffold(
      title: "HTTP Services",
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton.icon(
                  onPressed: () => _createNewService(context),
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
                    final uri = Uri.parse("https://doc.traefik.io/traefik/reference/routing-configuration/http/load-balancing/service/");
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
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                final serverUrls = service.loadBalancer?.servers.where((s) => s.hasUrl).map((s) => s.url).toList() ?? <String>[];
                final concattedServerUrls = serverUrls.join(", ");

                return ListTile(
                  title: Text("${service.name} (${service.type.name})"),
                  subtitle: Text(concattedServerUrls),
                  onTap: () => _openServiceEditScreen(context, service.name, service.type),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
