import 'package:flutter/cupertino.dart';
import 'package:frontend/src/core/extensions/packages/gorouter.extensions.dart';
import 'package:frontend/src/data/interfaces/core/routable_screen.interface.dart';
import 'package:frontend/src/global/typedefs.dart';
import 'package:frontend/src/modules/dashboard/screens/dashboard.screen.dart';
import 'package:frontend/src/modules/error/screens/error.screen.dart';
import 'package:frontend/src/modules/http/screens/httprouter.screen.dart';
import 'package:frontend/src/modules/http/screens/httpservices.screen.dart';
import 'package:frontend/src/modules/root/screens/approot.screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // -----------------------------------------------------------------------------------
  // Paths

  static const kRootRoute = "/";

  static const kErrorRoute = "/error";

  static const kDashboardRoute = "/dashboard";

  static const kHttpRoutersRoute = "/http/router";

  static const kHttpServicesRoute = "/http/services";

  // -----------------------------------------------------------------------------------
  // Routes

  static List<GoRoute> _routeBuilder() {
    final routes = <GoRoute>[];

    // Main App Routes
    routes.add(
      GoRoute(
        path: kRootRoute,
        pageBuilder: (context, state) => _pageBuilder(
          context,
          state,
          screen: AppRoot(argument: state.asArgument),
        ),
      ),
    );

    routes.add(
      GoRoute(
        path: kDashboardRoute,
        pageBuilder: (context, state) => _pageBuilder(
          context,
          state,
          screen: DashboardScreen(argument: state.asArgument),
        ),
      ),
    );

    // Http
    routes.add(
      GoRoute(
        path: kHttpRoutersRoute,
        pageBuilder: (context, state) => _pageBuilder(
          context,
          state,
          screen: HttpRouterScreen(argument: state.asArgument),
        ),
      ),
    );

    routes.add(
      GoRoute(
        path: kHttpServicesRoute,
        pageBuilder: (context, state) => _pageBuilder(
          context,
          state,
          screen: HttpServicesScreen(argument: state.asArgument),
        ),
      ),
    );

    // Auth Routes

    // Error Routes
    routes.add(
      GoRoute(
        path: kErrorRoute,
        pageBuilder: (context, state) => _pageBuilder(
          context,
          state,
          screen: ErrorScreen(
            argument: state.asArgument,
          ),
        ),
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

  // -----------------------------------------------------------------------------------
  // Helper

  static Page _pageBuilder(BuildContext context, GoRouterState state, {required IRoutableScreen screen}) {
    return NoTransitionPage(
      child: screen,
    );
  }
}
