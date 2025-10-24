import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/loadbalancer.model.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/mirror.model.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/weightedroundrobin.model.dart';
import 'package:traefik_frontend_shared/src/objects/core/nameable.model.dart';

part 'httpservice.model.g.dart';

/// https://doc.traefik.io/traefik/reference/routing-configuration/http/load-balancing/service/
@JsonSerializable()
class HttpService extends NameableModel {
  final LoadBalancer? loadBalancer;

  final WeightedRoundRobin? weighted;

  final Mirroring? mirroring;

  const HttpService({
    super.name,
    this.loadBalancer,
    this.weighted,
    this.mirroring,
  });

  /// The load balancers are able to load balance the requests between multiple instances of your programs.
  ///
  /// Each service has a load-balancer, even if there is only one server to forward traffic to.
  const HttpService.loadBalancer({super.name, this.loadBalancer}) : weighted = null, mirroring = null;

  /// The WRR is able to load balance the requests between multiple services based on weights.
  ///
  /// This strategy is only available to load balance between services and not between servers.
  const HttpService.weighted({super.name, this.weighted}) : loadBalancer = null, mirroring = null;

  /// The mirroring is able to mirror requests sent to a service to other services.
  const HttpService.mirroring({super.name, this.mirroring}) : loadBalancer = null, weighted = null;

  @override
  Map<String, dynamic> toJson() => _$HttpServiceToJson(this);

  factory HttpService.fromJson(Map<String, dynamic> json) => _$HttpServiceFromJson(json);
}
