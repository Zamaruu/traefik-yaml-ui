import 'package:json_annotation/json_annotation.dart';
import 'package:shared_models/src/objects/config/http/tls.model.dart';

part 'httprouter.model.g.dart';

@JsonSerializable()
class HttpRouter {
  final String? name;
  final String? rule;
  final String? service;
  final List<String> entryPoints;
  final List<String> middlewares;
  final Tls? tls;

  const HttpRouter({this.name, this.rule, this.service, this.entryPoints = const [], this.middlewares = const [], this.tls});

  Map<String, dynamic> toJson() => _$HttpRouterToJson(this);

  factory HttpRouter.fromJson(Map<String, dynamic> json) => _$HttpRouterFromJson(json);
}
