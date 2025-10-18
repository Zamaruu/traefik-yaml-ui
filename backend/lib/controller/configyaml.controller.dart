import 'dart:convert';
import 'package:traefik_frontend_api/controller/base.controller.dart';
import 'package:traefik_frontend_api/core/extensions/map.extensions.dart';
import 'package:traefik_frontend_api/services/configyaml.service.dart';
import 'package:shelf/shelf.dart';

class ConfigController extends BaseController {
  final ConfigService configService;

  ConfigController({
    super.path = "/config",
    required this.configService,
  });

  @override
  Future<Response> get(Request request) async {
    try {
      final config = await configService.loadConfig();
      return Response.ok(config.toJson);
    } catch (e, st) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
      );
    }
  }
}
