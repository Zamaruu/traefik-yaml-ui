import 'package:dio/dio.dart';

abstract class BaseApi {
  final Dio client;

  BaseApi(this.client);

  /// API-Endpunkt welcher für den bestimmten Controller verwendet werden soll.
  ///
  ///
  /// z.B. `"/config"` -> localhost:8000/api/config
  String get endpoint;

  // ------------------------------------------------------------------------
  // Requests

  Future<void> get({ProgressCallback? onProgress});
}
