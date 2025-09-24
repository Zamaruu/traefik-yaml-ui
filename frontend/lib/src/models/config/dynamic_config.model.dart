import 'package:frontend/src/models/config/http/http_config.model.dart';

class HTTPDynamicConfig {
  HTTPConfig? http;
  TCPConfig? tcp;

  HTTPDynamicConfig({this.http, this.tcp});

  factory HTTPDynamicConfig.fromJson(Map<String, dynamic> json) => HTTPDynamicConfig(
    http: json['http'] != null ? HTTPConfig.fromJson(json['http']) : null,
    tcp: json['tcp'] != null ? TCPConfig.fromJson(json['tcp']) : null,
  );

  Map<String, dynamic> toJson() => {
    if (http != null) 'http': http!.toJson(),
    if (tcp != null) 'tcp': tcp!.toJson(),
  };
}
