import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:traefik_frontend_ui/src/modules/http/provider/httpservices.provider.dart';

class HttpServicesScreen extends ConsumerScreenWidget {
  const HttpServicesScreen({super.key, required super.argument});

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
          final serverUrls = service.loadBalancer?.servers?.map((s) => s.url).whereType<String>().toList() ?? [];
          final urlsConcatted = serverUrls.join(", ");

          return ListTile(
            title: Text(service.name ?? "<kein Name>"),
            subtitle: Text(urlsConcatted),
          );
        },
      ),
    );
  }
}
