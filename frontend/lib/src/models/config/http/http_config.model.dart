import 'package:frontend/src/models/config/http/router/http_router.model.dart';

class HTTPConfig {
  Map<String, HTTPRouter>? routers;
  Map<String, HTTPService>? services;
  Map<String, HTTPMiddleware>? middlewares;

  HTTPConfig({this.routers, this.services, this.middlewares});

  factory HTTPConfig.fromJson(Map<String, dynamic> json) {
    return HTTPConfig(
      routers: json['routers'] != null
          ? (json['routers'] as Map<String, dynamic>).map((k,v) => MapEntry(k, HTTPRouter.fromJson(v as Map<String, dynamic>)))
          : null,
      services: json['services'] != null
          ? (json['services'] as Map<String, dynamic>).map((k,v) => MapEntry(k, HTTPService.fromJson(v as Map<String, dynamic>)))
          : null,
      middlewares: json['middlewares'] != null
          ? (json['middlewares'] as Map<String, dynamic>).map((k,v) => MapEntry(k, HTTPMiddleware.fromJson(v as Map<String, dynamic>)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (routers != null) m['routers'] = routers!.map((k,v) => MapEntry(k, v.toJson()));
    if (services != null) m['services'] = services!.map((k,v) => MapEntry(k, v.toJson()));
    if (middlewares != null) m['middlewares'] = middlewares!.map((k,v) => MapEntry(k, v.toJson()));
    return m;
  }
}
