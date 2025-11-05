import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:traefik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:traefik_frontend_ui/src/data/objects/core/router/base_argument.model.dart';
import 'package:go_router/go_router.dart';
import 'package:traefik_frontend_ui/src/modules/http/provider/httpservices.provider.dart';

class HttpServiceEditArgument extends BaseArgument {
  /// Name of the http service being edited.
  /// If no `serviceName` is provided a new, empty service can be created.
  final String? serviceName;

  final EHttpServiceType serviceType;

  const HttpServiceEditArgument({super.routerState, this.serviceName, required this.serviceType});

  factory HttpServiceEditArgument.fromState(GoRouterState state) {
    final name = state.uri.queryParameters["serviceName"];

    final typeString = state.uri.queryParameters["serviceType"];
    final type = EHttpServiceType.fromPath(typeString);

    return HttpServiceEditArgument(routerState: state, serviceName: name, serviceType: type);
  }

  @override
  Map<String, String> get queryParameters {
    final params = super.queryParameters;

    if (serviceName != null) params["serviceName"] = serviceName!;
    params["serviceType"] = serviceType.id.toString();

    return params;
  }
}

class HttpServiceEditScreen extends ConsumerStatefulScreenWidget<HttpServiceEditArgument> {
  const HttpServiceEditScreen({super.key, required super.argument});

  bool get hasServiceName => argument.serviceName != null && argument.serviceName!.isNotEmpty;

  @override
  ConsumerState<HttpServiceEditScreen> createState() => _HttpServiceEditScreenState();
}

class _HttpServiceEditScreenState extends ConsumerState<HttpServiceEditScreen> {
  String? get serviceName => widget.argument.serviceName;

  late final GlobalKey formKey;

  late final HttpService? initialServiceState;

  late HttpService serviceEditState;

  @override
  void initState() {
    super.initState();

    serviceEditState = const HttpService();
    initialServiceState = ref.read(httpServicesProvider).where((r) => r.name == serviceName).firstOrNull;

    if (initialServiceState != null) serviceEditState = initialServiceState!;

    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.hasServiceName ? "${serviceName!} bearbeiten" : "Neuen Service erstellen",
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 8),
                  child: SelectableText(
                    "Generelles",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: serviceEditState.name,
                  decoration: const InputDecoration(
                    label: Text("Service Name"),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 8, top: 16),
                  child: Row(
                    children: [
                      const SelectableText(
                        "Entrypoints",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 8, top: 16),
                  child: Row(
                    children: [
                      const SelectableText(
                        "Middlewares",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
