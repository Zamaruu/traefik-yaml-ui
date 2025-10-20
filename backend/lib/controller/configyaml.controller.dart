import 'dart:convert';
import 'package:traefik_frontend_api/controller/base.controller.dart';
import 'package:traefik_frontend_api/services/configyaml.service.dart';
import 'package:shelf/shelf.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:uuid/uuid.dart';

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
      final json = config.asEncodedJson;
      return Response.ok(json);
    } catch (e, st) {
      final uuid = const Uuid().v4();

      final error = ApiError(
        logUuid: uuid,
        error: e.toString(),
        stackTrace: st,
      );

      return Response.internalServerError(
        body: error.asEncodedJson,
      );
    }
  }
}
