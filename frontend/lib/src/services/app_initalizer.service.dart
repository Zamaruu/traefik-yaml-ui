import 'package:dio/dio.dart';
import 'package:treafik_frontend_ui/service_locator.dart';
import 'package:treafik_frontend_ui/src/data/interfaces/core/response.interface.dart';
import 'package:treafik_frontend_ui/src/data/objects/core/response/response.model.dart';

class AppInitalizerService {
  Future<IResponse> initializeApp() async {
    final responses = await Future.wait([
      _initializeDio(),
    ]);

    final initalizerResponse = BaseResponse.fromMultiple(responses);
    return initalizerResponse;
  }

  Future<IResponse> _initializeDio() async {
    try {
      final originUrl = Uri.base.host;
      final options = BaseOptions(
        baseUrl: "http://$originUrl:3000",
      );

      final client = Dio(options);

      services.registerSingleton(client);
      return const BaseResponse.success();
    } catch (e, st) {
      return BaseResponse.error(exception: e, stackTrace: st);
    }
  }
}
