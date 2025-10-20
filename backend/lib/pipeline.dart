import 'package:shelf/shelf.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:traefik_frontend_api/routes.dart';

import 'core/injection/injector.dart';
import 'middlewares/headers.middleware.dart';

Future<Handler> buildPipeline() async {
  final router = services.get<ApiRouter>();
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addMiddleware(defaultHeaders())
      .addHandler(
        router.router,
      );

  return handler;
}
