import 'package:traefik_frontend_ui/src/data/objects/core/router/router_argument.abstract.dart';
import 'package:go_router/go_router.dart';

class BaseArgument extends RouterArgument {
  const BaseArgument({super.routerState});

  factory BaseArgument.fromState(GoRouterState state) {
    return BaseArgument(routerState: state);
  }
}
