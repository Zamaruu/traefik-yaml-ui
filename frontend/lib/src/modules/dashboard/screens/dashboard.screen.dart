import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/router.dart';
import 'package:frontend/src/core/extensions/sdk/context.extensions.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';
import 'package:frontend/src/modules/root/provider/rootconfig.provider.dart';

class DashboardScreen extends ConsumerScreenWidget {
  const DashboardScreen({
    super.key,
    required super.argument,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configRootProvider);

    return AppScaffold(
      title: "Dashboard",
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (config.hasHttpConfig)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SelectableText(
                  "HTTP Configs",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final httpConfig = config.http!;
                    final routerCount = httpConfig.routers.length;
                    final servicesCount = httpConfig.services.length;

                    return SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Card(
                            child: SizedBox(
                              width: 160,
                              child: InkWell(
                                onTap: () => context.pushRoute(AppRouter.kHttpRoutersRoute),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: SelectableText(routerCount.toString()),
                                      subtitle: const SelectableText("Router"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: SizedBox(
                              width: 160,
                              child: InkWell(
                                onTap: () => context.pushRoute(AppRouter.kHttpServicesRoute),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: SelectableText(servicesCount.toString()),
                                      subtitle: const SelectableText("Services"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}
