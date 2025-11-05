import 'package:traefik_frontend_shared/src/objects/config/http/server.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loadbalancer.model.g.dart';

@JsonSerializable()
class LoadBalancer {
  final List<Server> servers;

  final bool? passHostHeader;

  final String? serversTransport;

  const LoadBalancer({
    this.servers = const [],
    this.serversTransport,
    this.passHostHeader,
  });

  Map<String, dynamic> toJson() => _$LoadBalancerToJson(this);

  factory LoadBalancer.fromJson(Map<String, dynamic> json) => _$LoadBalancerFromJson(json);

  // --------------------------------------------------------------------------
  // Getter

  bool get hasServers => servers.isNotEmpty;
}
