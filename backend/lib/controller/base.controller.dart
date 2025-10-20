import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:traefik_frontend_api/data/interfaces/controller.interface.dart';

abstract class BaseController implements IController {
  @override
  final String path;

  const BaseController({required this.path});

  static String get kPathRoot => '/';

  @override
  Handler get handler {
    final router = Router();

    router.get(kPathRoot, get);
    router.post(kPathRoot, post);
    router.put(kPathRoot, put);
    router.delete(kPathRoot, delete);
    router.patch(kPathRoot, patch);

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
