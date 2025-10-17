import 'package:treafik_frontend_ui/src/data/objects/config/http/loadbalancer.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'httpservice.model.g.dart';

@JsonSerializable()
class HttpService {
  final String? name;
  final LoadBalancer? loadBalancer;

  const HttpService({this.name, this.loadBalancer});

  Map<String, dynamic> toJson() => _$HttpServiceToJson(this);

  factory HttpService.fromJson(Map<String, dynamic> json) => _$HttpServiceFromJson(json);
}
