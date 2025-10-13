import 'dart:convert';
import 'package:backend/core/extensions/map.extensions.dart';
import 'package:backend/services/configyaml.service.dart';
import 'package:shelf/shelf.dart';

class ConfigController {
  final ConfigService _service;

  ConfigController(this._service);

  Future<Response> getConfig(Request request) async {
    try {
      final config = await _service.loadConfig();
      return Response.ok(config.toJson);
    } catch (e, st) {
      return Response.internalServerError(
        body: jsonEncode({'error': e.toString()}),
      );
    }
  }
}
