import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/tls/tls.model.dart';
import 'package:traefik_frontend_shared/src/objects/core/nameable.model.dart';

part 'httprouter.model.g.dart';

/// https://doc.traefik.io/traefik/reference/routing-configuration/http/routing/router/
@JsonSerializable()
class HttpRouter extends NameableModel {
  /// To avoid path overlap, routes are sorted, by default, in descending order using rules length.
  /// The priority is directly equal to the length of the rule, and so the longest length has the highest priority.
  /// A value of 0 for the priority is ignored.
  final int? priority;

  /// Rules are a set of matchers configured with values, that determine if a particular request matches specific criteria.
  /// If the rule is verified, the router becomes active, calls middlewares, and then forwards the request to the service.
  final String? rule;

  /// The name of the service that will handle the matched requests.
  /// Services can be load balancer services, weighted round robin, mirroring, or failover services.
  final String service;

  /// The list of entry points to which the router is attached.
  /// If not specified, HTTP routers are attached to all entry points.
  final List<String> entryPoints;

  /// The list of middlewares that are applied to the router.
  /// Middlewares are applied in the order they are declared
  final List<String> middlewares;

  /// TLS configuration for the router. When specified, the router will only handle HTTPS requests.
  final Tls? tls;

  const HttpRouter({
    super.name,
    this.priority,
    this.rule,
    this.service = "",
    this.entryPoints = const [],
    this.middlewares = const [],
    this.tls,
  });

  Map<String, dynamic> toJson() => _$HttpRouterToJson(this);

  factory HttpRouter.fromJson(Map<String, dynamic> json) => _$HttpRouterFromJson(json);
}
