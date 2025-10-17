import 'package:dio/dio.dart';
import 'package:treafik_frontend_ui/src/data/interfaces/core/response.interface.dart';

abstract class BaseApi<T extends Object> {
  final Dio client;

  BaseApi(this.client);

  /// API-Endpunkt welcher für den bestimmten Controller verwendet werden soll.
  ///
  ///
  /// z.B. `"/config"` -> localhost:8000/api/config
  String get endpoint;

  // ------------------------------------------------------------------------
  // Requests

  Future<IValueResponse<T>> get({ProgressCallback? onProgress});
}
