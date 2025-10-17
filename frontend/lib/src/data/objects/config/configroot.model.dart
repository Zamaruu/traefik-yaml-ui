import 'package:treafik_frontend_ui/src/data/objects/config/http/httpconfig.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'configroot.model.g.dart';

@JsonSerializable()
class ConfigRoot {
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
