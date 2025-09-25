import 'package:frontend/src/models/interfaces/core/argument.interface.dart';
import 'package:go_router/go_router.dart';

abstract class RouterArgument implements IRouterArgument {
  @override
  final GoRouterState routerState;

  const RouterArgument({required this.routerState});
}
