import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';
import 'package:frontend/src/data/objects/core/router/base_argument.model.dart';
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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.hasRouterName ? "${routerName!} bearbeiten" : "Neuen Router erstellen",
      body: const Placeholder(),
    );
  }
}
