import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:frontend/router.dart';
import 'package:frontend/src/global/typedefs.dart';
import 'package:frontend/src/services/app_initalizer.service.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  final initalizer = AppInitalizerService();
  await initalizer.initializeApp();

  runApp(
    const ProviderScope(
      child: TraefikUiApp(),
    ),
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
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: "Treafik UI",
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        color: const Color(0xff24a1c1),
      ),
    );
  }
}
