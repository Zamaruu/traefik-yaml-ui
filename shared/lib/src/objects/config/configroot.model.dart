import 'package:traefik_frontend_shared/src/objects/config/http/httpconfig.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/core/base.model.dart';

part 'configroot.model.g.dart';

@JsonSerializable()
class ConfigRoot extends BaseModel {
  final Http? http;
  // TODO: TCP implement config options
  // TODO: UDP implement config options

  const ConfigRoot({this.http});

  Map<String, dynamic> toJson() => _$ConfigRootToJson(this);

  factory ConfigRoot.fromJson(Map<String, dynamic> json) => _$ConfigRootFromJson(json);

  // --------------------------------------------------------
  // Getter

  bool get hasHttpConfig => http != null;
}
