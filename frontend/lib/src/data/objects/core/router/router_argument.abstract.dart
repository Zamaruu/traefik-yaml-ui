import 'package:frontend/src/data/interfaces/core/argument.interface.dart';
import 'package:go_router/go_router.dart';

abstract class RouterArgument implements IRouterArgument {
  @override
  final GoRouterState? routerState;

  const RouterArgument({this.routerState});

  @override
  Map<String, String> get queryParameters {
    return routerState?.uri.queryParameters ?? {};
  }

  @override
  String toQueryString() => "";
}
