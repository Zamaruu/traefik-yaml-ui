import 'package:frontend/src/models/config/http/router/obersvability.model.dart';
import 'package:frontend/src/models/config/http/router/router_tls_config.model.dart';

class HTTPRouter {
  List<String>? entryPoints;
  String rule;
  String service;
  List<String>? middlewares;
  int? priority;
  RouterTLSConfig? tls;
  String? ruleSyntax;
  Observability? observability;

  HTTPRouter({
    this.entryPoints,
    required this.rule,
    required this.service,
    this.middlewares,
    this.priority,
    this.tls,
    this.ruleSyntax,
    this.observability,
  });

  factory HTTPRouter.fromJson(Map<String, dynamic> json) => HTTPRouter(
    entryPoints: (json['entryPoints'] as List<dynamic>?)?.map((e) => e as String).toList(),
    rule: json['rule'] as String,
    service: json['service'] as String,
    middlewares: (json['middlewares'] as List<dynamic>?)?.map((e) => e as String).toList(),
    priority: json['priority'] as int?,
    tls: json['tls'] != null ? RouterTLSConfig.fromJson(json['tls'] as Map<String, dynamic>) : null,
    ruleSyntax: json['ruleSyntax'] as String?,
    observability: json['observability'] != null ? Observability.fromJson(json['observability'] as Map<String, dynamic>) : null,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{
      'rule': rule,
      'service': service,
    };
    if (entryPoints != null) m['entryPoints'] = entryPoints;
    if (middlewares != null) m['middlewares'] = middlewares;
    if (priority != null) m['priority'] = priority;
    if (tls != null) m['tls'] = tls!.toJson();
    if (ruleSyntax != null) m['ruleSyntax'] = ruleSyntax;
    if (observability != null) m['observability'] = observability!.toJson();
    return m;
  }
}
