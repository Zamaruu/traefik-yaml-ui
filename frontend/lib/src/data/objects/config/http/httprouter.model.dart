import 'package:frontend/src/data/objects/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'httprouter.model.g.dart';

@JsonSerializable()
class HttpRouter {
  final String? name;
  final String? rule;
  final String? service;
  final List<String?>? entryPoints;
  final List<String?>? middlewares;
  final Tls? tls;

  const HttpRouter({
    this.name,
    this.rule,
    this.service,
    this.entryPoints,
    this.middlewares,
    this.tls,
  });

  Map<String, dynamic> toJson() => _$HttpRouterToJson(this);

  factory HttpRouter.fromJson(Map<String, dynamic> json) => _$HttpRouterFromJson(json);
}
