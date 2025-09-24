import 'package:frontend/src/models/config/http/services/server.model.dart';
import 'package:frontend/src/models/config/http/services/sticky.model.dart';

class LoadBalancer {
  List<Server> servers;
  bool? passHostHeader;
  Sticky? sticky;

  LoadBalancer({
    required this.servers,
    this.passHostHeader,
    this.sticky,
  });

  factory LoadBalancer.fromJson(Map<String, dynamic> json) => LoadBalancer(
    servers: (json['servers'] as List<dynamic>).map((e) => Server.fromJson(e as Map<String, dynamic>)).toList(),
    passHostHeader: json['passHostHeader'] as bool?,
    sticky: json['sticky'] != null ? Sticky.fromJson(json['sticky'] as Map<String, dynamic>) : null,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{ 'servers': servers.map((s) => s.toJson()).toList() };
    if (passHostHeader != null) m['passHostHeader'] = passHostHeader;
    if (sticky != null) m['sticky'] = sticky!.toJson();
    return m;
  }
}
