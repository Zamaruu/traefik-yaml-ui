import 'package:frontend/src/models/objects/core/router/router_argument.abstract.dart';
import 'package:go_router/go_router.dart';

class BaseArgument extends RouterArgument {
  BaseArgument({required super.routerState});

  factory BaseArgument.fromState(GoRouterState state) {
    return BaseArgument(routerState: state);
  }
}
