import 'package:dio/dio.dart';
import 'package:frontend/service_locator.dart';
import 'package:frontend/src/data/interfaces/core/response.interface.dart';
import 'package:frontend/src/data/objects/core/response/response.model.dart';

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
      final options = BaseOptions(
        baseUrl: "http://localhost:3000/",
      );

      final client = Dio(options);

      services.registerSingleton(client);
      return const BaseResponse.success();
    } catch (e, st) {
      print(e);
      return BaseResponse.error(exception: e, stackTrace: st);
    }
  }
}
