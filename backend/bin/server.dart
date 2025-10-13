import 'dart:io';
import 'package:backend/config/environment.dart';
import 'package:backend/middlewares/headers.middleware.dart';
import 'package:backend/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

Future<void> main(List<String> args) async {
  await Environment.load();

  final ip = InternetAddress.anyIPv4;
  final port = Environment.port;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(defaultHeaders())
      .addHandler(createRouter().call);

  final server = await serve(handler, ip, port);
  print('✅ Server läuft auf http://${server.address.host}:${server.port}');
}
