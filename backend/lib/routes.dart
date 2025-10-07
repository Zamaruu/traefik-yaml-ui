import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router createRouter() {
  final router = Router();

  // Basisroute
  router.get('/', (Request req) {
    final response = {"message": "Willkommen aus Dart"};


    return Response.ok(
      jsonEncode(response),
      headers: {'Content-Type': 'application/json'},
    );
  });

  // User-Routen
  //router.mount('/users/', userHandler);

  return router;
}
