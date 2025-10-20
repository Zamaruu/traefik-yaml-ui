import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/httprouter.model.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/httpservice.model.dart';

part 'httpconfig.model.g.dart';

@JsonSerializable()
class Http {
  final List<Middleware>? middlewares;
  final List<ServerTransport>? serversTransports;
  final List<HttpService> services;
  final List<HttpRouter> routers;

  const Http({
    this.middlewares = const [],
    this.serversTransports = const [],
    this.services = const [],
    this.routers = const [],
  });

  Map<String, dynamic> toJson() => _$HttpToJson(this);

  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}
