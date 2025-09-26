import 'package:flutter/material.dart';
import 'package:frontend/router.dart';
import 'package:frontend/src/global/typedefs.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const TraefikUiApp(),
  );
}

class TraefikUiApp extends StatefulWidget {
  const TraefikUiApp({super.key});

  @override
  State<TraefikUiApp> createState() => _TraefikUiAppState();
}

class _TraefikUiAppState extends State<TraefikUiApp> {
  late final NavigatorKey globalNavKey;

  late final GoRouter appRouter;

  // -----------------------------------------------------------------------
  // Lifecycle

  @override
  void initState() {
    globalNavKey = GlobalKey<NavigatorState>();
    appRouter = AppRouter.buildRouter(navKey: globalNavKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Treafik UI",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
