import 'package:go_router/go_router.dart';

abstract interface class IRouterArgument {
  GoRouterState? get routerState;

  Map<String, String> get queryParameters;

  String toQueryString();
}
