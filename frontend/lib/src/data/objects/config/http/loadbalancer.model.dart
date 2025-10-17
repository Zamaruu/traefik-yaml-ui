import 'package:treafik_frontend_ui/src/data/objects/config/http/server.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loadbalancer.model.g.dart';

@JsonSerializable()
class LoadBalancer {
  final List<Server>? servers;

  final String? serversTransport;

  const LoadBalancer({this.servers, this.serversTransport});

  Map<String, dynamic> toJson() => _$LoadBalancerToJson(this);

  factory LoadBalancer.fromJson(Map<String, dynamic> json) => _$LoadBalancerFromJson(json);
}
