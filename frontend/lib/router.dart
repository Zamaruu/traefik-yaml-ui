import 'package:frontend/src/core/extensions/packages/gorouter.extensions.dart';
import 'package:frontend/src/global/typedefs.dart';
import 'package:frontend/src/modules/dashboard/screens/dashboard.screen.dart';
import 'package:frontend/src/modules/error/screens/error.screen.dart';
import 'package:frontend/src/modules/http/screens/httprouter.screen.dart';
import 'package:frontend/src/modules/root/screens/approot.screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // -----------------------------------------------------------------------------------
  // Paths

  static const kRootRoute = "/";

  static const kErrorRoute = "/error";

  static const kDashboardRoute = "/dashboard";

  static const kHttpRoutersRoute = "/http/router";

  // -----------------------------------------------------------------------------------
  // Routes

  static List<GoRoute> _routeBuilder() {
    final routes = <GoRoute>[];

    // Main App Routes
    routes.add(
      GoRoute(
        path: kRootRoute,
        builder: (context, state) {
          return AppRoot(argument: state.asArgument);
        },
      ),
    );

    routes.add(
      GoRoute(
        path: kDashboardRoute,
        builder: (context, state) {
          return DashboardScreen(argument: state.asArgument);
        },
      ),
    );

    // Http
    routes.add(
      GoRoute(
        path: kHttpRoutersRoute,
        builder: (context, state) {
          return HttpRouterScreen(argument: state.asArgument);
        },
      ),
    );

    // Auth Routes

    // Error Routes
    routes.add(
      GoRoute(
        path: kErrorRoute,
        builder: (context, state) {
          return ErrorScreen(argument: state.asArgument);
        },
      ),
    );

    return routes;
  }

  // -----------------------------------------------------------------------------------
  // Router-Erstellung

  static GoRouter buildRouter({
    required NavigatorKey navKey,
  }) {
    return GoRouter(
      navigatorKey: navKey,
      routes: _routeBuilder(),
    );
  }
}
