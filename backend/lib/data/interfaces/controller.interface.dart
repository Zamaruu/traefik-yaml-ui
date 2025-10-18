import 'package:shelf/shelf.dart';

abstract interface class IController {
  String get path;

  Handler get handler;

  Future<Response> get(Request request);

  Future<Response> post(Request request);

  Future<Response> put(Request request);

  Future<Response> delete(Request request);

  Future<Response> patch(Request request);
}
