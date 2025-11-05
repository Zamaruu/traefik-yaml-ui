import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_ui/router.dart';
import 'package:traefik_frontend_ui/src/core/extensions/sdk/context.extensions.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:traefik_frontend_ui/src/modules/http/provider/httpservices.provider.dart';
import 'package:traefik_frontend_ui/src/modules/http/screens/services/httpserviceedit.screen.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(httpServicesProvider);

    return AppScaffold(
      title: "HTTP Services",
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          final serverUrls = service.loadBalancer?.servers.where((s) => s.hasUrl).map((s) => s.url).toList() ?? <String>[];
          final concattedServerUrls = serverUrls.join(", ");

          return ListTile(
            title: Text(service.name),
            subtitle: Text(concattedServerUrls),
            onTap: () => _openServiceEditScreen(context, service.name, service.type),
          );
        },
      ),
    );
  }
}
