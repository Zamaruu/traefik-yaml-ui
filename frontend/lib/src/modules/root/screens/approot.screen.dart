import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treafik_frontend_ui/router.dart';
import 'package:treafik_frontend_ui/service_locator.dart';
import 'package:treafik_frontend_ui/src/core/helper/notifications.helper.dart';
import 'package:treafik_frontend_ui/src/core/widgets/app_scaffold.widget.dart';
import 'package:treafik_frontend_ui/src/core/widgets/app_screen.widget.dart';
import 'package:treafik_frontend_ui/src/data/enums/initstate.enum.dart';
import 'package:treafik_frontend_ui/src/data/enums/notification.enum.dart';
import 'package:treafik_frontend_ui/src/modules/error/widgets/error.widget.dart';
import 'package:treafik_frontend_ui/src/modules/root/provider/rootconfig.provider.dart';
import 'package:treafik_frontend_ui/src/services/api/config.api.dart';
import 'package:go_router/go_router.dart';

class AppRoot extends ConsumerStatefulScreenWidget {
  const AppRoot({super.key, required super.argument});

  @override
  ConsumerState<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<AppRoot> {
  late EInitState appState;

  @override
  void initState() {
    super.initState();

    appState = EInitState.uninitalized;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mockedLoader();
    });
  }

  void _mockedLoader() async {
    await Future.delayed(const Duration(seconds: 2));

    final httpClient = services.get<Dio>();
    final configController = ConfigApiController(httpClient);
    final configResponse = await configController.get();

    if (mounted && configResponse.isSuccess && configResponse.hasValue) {
      ref.read(configRootProvider.notifier).setConfig(configResponse.value!);

      NotificationHelper.showNotification(
        context: context,
        title: "Config erfolgreich geladen",
        type: ENotification.success,
      );

      context.go(AppRouter.kDashboardRoute);
    } else {
      if (mounted) {
        NotificationHelper.showNotification(
          context: context,
          title: "Fehler beim laden der Config",
          description: configResponse.message,
          type: ENotification.error,
        );
      }
      setState(() {
        appState = EInitState.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Traefik Config UI",
      disableMenu: true,
      body: Center(
        child: Builder(
          builder: (context) {
            if (appState == EInitState.initalized) {
              return const Icon(Icons.check, color: Colors.green);
            } else if (appState == EInitState.loading || appState == EInitState.uninitalized) {
              return const CircularProgressIndicator();
            } else {
              return const AppErrorInfoBox(error: "Fehler bei der Initalisierung");
            }
          },
        ),
      ),
    );
  }
}
