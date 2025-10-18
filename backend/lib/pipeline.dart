import 'package:shelf/shelf.dart';
import 'package:traefik_frontend_api/routes.dart';

import 'core/injection/injector.dart';
import 'middlewares/headers.middleware.dart';

Future<Handler> buildPipeline() async {
  final router = services.get<ApiRouter>();
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(defaultHeaders())
      .addHandler(
        router.router,
      );

  return handler;
}
