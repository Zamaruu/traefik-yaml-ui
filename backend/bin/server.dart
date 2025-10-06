import 'dart:io';
import 'package:backend/routes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

Future<void> main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;
  const port = 8080;

  final handler = Pipeline()
      .addMiddleware(logRequests()) // loggt alle Requests
      .addHandler(createRouter().call);

  final server = await serve(handler, ip, port);
  print('✅ Server läuft auf http://${server.address.host}:${server.port}');
}