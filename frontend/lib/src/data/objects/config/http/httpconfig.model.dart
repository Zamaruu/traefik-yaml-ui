import 'package:frontend/src/data/objects/config/http/httprouter.model.dart';
import 'package:frontend/src/data/objects/config/http/httpservice.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'httpconfig.model.g.dart';

@JsonSerializable()
class Http {
  // final List<Middleware?>? middlewares;
  // final List<ServersTransport?>? serversTransports;
  final List<HttpService?>? services;
  final List<HttpRouter?>? routers;

  const Http({
    // this.middlewares,
    // this.serversTransports,
    this.services,
    this.routers,
  });

  Map<String, dynamic> toJson() => _$HttpToJson(this);

  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}
