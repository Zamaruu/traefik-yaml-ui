import 'package:get_it/get_it.dart';
import 'package:traefik_frontend_api/controller/configyaml.controller.dart';
import 'package:traefik_frontend_api/routes.dart';
import 'package:traefik_frontend_api/services/configyaml.service.dart';

final services = GetIt.instance;

Future<void> setupDependencies() async {
  // Service dependecies
  services.registerLazySingleton<ConfigService>(() => ConfigService());

  // API-Controller dependencies
  services.registerCachedFactory<ConfigController>(
    () => ConfigController(
      configService: services.get<ConfigService>(),
    ),
  );

  // Router
  final router = ApiRouter(
    configController: services.get<ConfigController>(),
  );
  services.registerSingleton<ApiRouter>(router);
}
