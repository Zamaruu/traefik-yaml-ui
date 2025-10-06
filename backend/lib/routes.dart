import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router createRouter() {
  final router = Router();

  // Basisroute
  router.get('/', (Request req) {
    return Response.ok('👋 Willkommen bei der Dart Shelf API!');
  });

  // User-Routen
  //router.mount('/users/', userHandler);

  return router;
}
