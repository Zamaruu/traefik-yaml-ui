import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/ipallowlist.model.dart';

part 'httpmiddleware.model.g.dart';

@JsonSerializable()
class Middleware {
  final String? name;
  final IpAllowList? ipAllowList;
  final ForwardAuth? forwardauth;

  const Middleware({this.name, this.ipAllowList, this.forwardauth});

  factory Middleware.fromJson(Map<String, dynamic> json) => _$MiddlewareFromJson(json);

  Map<String, dynamic> toJson() => _$MiddlewareToJson(this);
}
