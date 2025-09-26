import 'package:dio/dio.dart';
import 'package:frontend/constans.dart';
import 'package:frontend/src/services/api/base.api.dart';

class ConfigApiController extends BaseApi {
  ConfigApiController(super.client);

  @override
  String get endpoint => ApiConstants.configEndpoint;

  // ------------------------------------------------------------------------
  // Requests

  @override
  Future<void> get({ProgressCallback? onProgress}) async {
    final response = await client.get(
      endpoint,
      onReceiveProgress: onProgress,
    );

    print(response);
  }
}
