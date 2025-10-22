import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/loadbalancer.model.dart';
import 'package:traefik_frontend_shared/src/objects/core/nameable.model.dart';

part 'httpservice.model.g.dart';

/// https://doc.traefik.io/traefik/reference/routing-configuration/http/load-balancing/service/
@JsonSerializable()
class HttpService extends NameableModel {
  final LoadBalancer? loadBalancer;

  const HttpService({
    super.name,
    this.loadBalancer,
  });

  @override
  Map<String, dynamic> toJson() => _$HttpServiceToJson(this);

  factory HttpService.fromJson(Map<String, dynamic> json) => _$HttpServiceFromJson(json);
}
