import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:traefik_frontend_api/config/environment.dart';
import 'package:traefik_frontend_api/core/injection/injector.dart';
import 'package:traefik_frontend_api/pipeline.dart';

Future<void> main(List<String> args) async {
  await Environment.load();
  await setupDependencies();

  final ip = InternetAddress.anyIPv4;
  final port = Environment.port;

  final handler = await buildPipeline();

  final server = await serve(handler, ip, port);
  print('✅ Server läuft auf http://${server.address.host}:${server.port}');
}
