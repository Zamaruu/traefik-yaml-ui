import 'package:frontend/src/models/interfaces/core/argument.interface.dart';
import 'package:frontend/src/models/objects/core/router/base_argument.model.dart';
import 'package:go_router/go_router.dart';

extension GoRouterStateExtensions on GoRouterState {
  IRouterArgument get asArgument => BaseArgument.fromState(this);
}
