import 'package:traefik_frontend_ui/src/data/interfaces/core/argument.interface.dart';
import 'package:traefik_frontend_ui/src/data/objects/core/router/base_argument.model.dart';
import 'package:go_router/go_router.dart';

extension GoRouterStateExtensions on GoRouterState {
  IRouterArgument get asArgument => BaseArgument.fromState(this);
}
