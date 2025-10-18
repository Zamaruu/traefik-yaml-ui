import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_models/shared_models.dart';
import 'package:treafik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:treafik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:treafik_frontend_ui/src/data/objects/core/router/base_argument.model.dart';
import 'package:treafik_frontend_ui/src/modules/http/provider/httprouter.provider.dart';
import 'package:go_router/go_router.dart';

class HttpRouterEditArgument extends BaseArgument {
  /// Name of the http router being edited.
  /// If no `routerName` is provided a new, empty router can be created.
  final String? routerName;

  const HttpRouterEditArgument({super.routerState, this.routerName});

  factory HttpRouterEditArgument.fromState(GoRouterState state) {
    final name = state.uri.queryParameters["routerName"];

    return HttpRouterEditArgument(routerState: state, routerName: name);
  }

  @override
  Map<String, String> get queryParameters {
    final params = super.queryParameters;
    if (routerName != null) params["routerName"] = routerName!;
    return params;
  }
}

class HttpRouterEditScreen extends ConsumerStatefulScreenWidget<HttpRouterEditArgument> {
  const HttpRouterEditScreen({super.key, required super.argument});

  bool get hasRouterName => argument.routerName != null && argument.routerName!.isNotEmpty;

  @override
  ConsumerState<HttpRouterEditScreen> createState() => _HttpRouterEditScreenState();
}

class _HttpRouterEditScreenState extends ConsumerState<HttpRouterEditScreen> {
  String? get routerName => widget.argument.routerName;

  late final GlobalKey formKey;

  late final HttpRouter? initialRouterState;

  late HttpRouter routerEditState;

  @override
  void initState() {
    super.initState();

    routerEditState = const HttpRouter();
    initialRouterState = ref.read(httpRouterProvider).where((r) => r.name == routerName).firstOrNull;

    if (initialRouterState != null) routerEditState = initialRouterState!;

    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.hasRouterName ? "${routerName!} bearbeiten" : "Neuen Router erstellen",
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
                  initialValue: routerEditState.name,
                  decoration: const InputDecoration(
                    label: Text("Router Name"),
                  ),
                ),
                TextFormField(
                  initialValue: routerEditState.service,
                  decoration: const InputDecoration(
                    label: Text("Service"),
                  ),
                ),
                TextFormField(
                  initialValue: routerEditState.rule,
                  decoration: const InputDecoration(
                    label: Text("Rule"),
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
                for (final entrypoint in routerEditState.entryPoints)
                  ListTile(
                    title: SelectableText(entrypoint),
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
                for (final middleware in routerEditState.middlewares)
                  ListTile(
                    title: SelectableText(middleware),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
