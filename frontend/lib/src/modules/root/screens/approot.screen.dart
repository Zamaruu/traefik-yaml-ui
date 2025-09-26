import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/router.dart';
import 'package:frontend/service_locator.dart';
import 'package:frontend/src/core/widgets/app_scaffold.widget.dart';
import 'package:frontend/src/core/widgets/app_screen.widget.dart';
import 'package:frontend/src/data/enums/initstate.enum.dart';
import 'package:frontend/src/modules/error/widgets/error.widget.dart';
import 'package:frontend/src/services/api/config.api.dart';
import 'package:go_router/go_router.dart';

class AppRoot extends StatefulScreenWidget {
  const AppRoot({super.key, required super.argument});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
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
    final configJsonResponse = await configController.get();

    if (mounted && configJsonResponse.isSuccess) {
      Fluttertoast.showToast(
        msg: "Config erfolgreich abgerufen",
        backgroundColor: Colors.green,
        gravity: ToastGravity.TOP_RIGHT,
        toastLength: Toast.LENGTH_LONG,
      );
      context.go(AppRouter.kDashboardRoute);
    } else {
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
