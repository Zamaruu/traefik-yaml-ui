import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:treafik_frontend_api/controller/configyaml.controller.dart';

class ApiRouter {
  final ConfigController _configController;

  ApiRouter({
    required ConfigController configController,
  }) : _configController = configController;

  Handler get router {
    final router = Router();

    router.mount(_configController.path, _configController.handler);

    return router;
  }
}
