import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:traefik_frontend_api/data/interfaces/controller.interface.dart';

abstract class BaseController implements IController {
  @override
  final String path;

  const BaseController({required this.path});

  @override
  Handler get handler {
    final router = Router();
    return router.call;
  }

  @override
  Future<Response> get(Request request) async {
    return Response.notFound('Not Implemented');
  }

  @override
  Future<Response> post(Request request) async {
    return Response.notFound('Not Implemented');
  }

  @override
  Future<Response> put(Request request) async {
    return Response.notFound('Not Implemented');
  }

  @override
  Future<Response> delete(Request request) async {
    return Response.notFound('Not Implemented');
  }

  @override
  Future<Response> patch(Request request) async {
    return Response.notFound('Not Implemented');
  }
}
