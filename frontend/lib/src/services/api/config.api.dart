import 'dart:io';

import 'package:dio/dio.dart';
import 'package:frontend/constans.dart';
import 'package:frontend/src/core/extensions/packages/dio.extensions.dart';
import 'package:frontend/src/data/interfaces/core/response.interface.dart';
import 'package:frontend/src/data/objects/config/configroot.model.dart';
import 'package:frontend/src/data/objects/core/response/valueresponse.modeldart.dart';
import 'package:frontend/src/services/api/base.api.dart';

class ConfigApiController extends BaseApi<ConfigRoot> {
  ConfigApiController(super.client);

  @override
  String get endpoint => ApiConstants.configEndpoint;

  // ------------------------------------------------------------------------
  // Requests

  @override
  Future<IValueResponse<ConfigRoot>> get({ProgressCallback? onProgress}) async {
    try {
      final response = await client.get<Map<String, dynamic>>(
        endpoint,
        onReceiveProgress: onProgress,
      );

      if (response.statusCode == HttpStatus.ok) {
        final json = response.json;
        final data = ConfigRoot.fromJson(json);
        return ValueResponse.success(value: data);
      } else {
        return ValueResponse.error(message: response.statusMessage ?? "");
      }
    } catch (e, st) {
      return ValueResponse.error(
        exception: e,
        stackTrace: st,
        message: e.toString(),
      );
    }
  }
}
