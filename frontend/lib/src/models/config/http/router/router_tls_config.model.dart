import 'package:frontend/src/models/config/http/router/domain.model.dart';

class RouterTLSConfig {
  String? certResolver;
  List<Domain>? domains;
  String? options;
  bool? passthrough;

  RouterTLSConfig({ this.certResolver, this.domains, this.options, this.passthrough });

  factory RouterTLSConfig.fromJson(Map<String, dynamic> json) => RouterTLSConfig(
    certResolver: json['certResolver'] as String?,
    domains: (json['domains'] as List<dynamic>?)?.map((e) => Domain.fromJson(e as Map<String, dynamic>)).toList(),
    options: json['options'] as String?,
    passthrough: json['passthrough'] as bool?,
  );

  Map<String, dynamic> toJson() {
    final m = <String, dynamic>{};
    if (certResolver != null) m['certResolver'] = certResolver;
    if (domains != null) m['domains'] = domains!.map((d) => d.toJson()).toList();
    if (options != null) m['options'] = options;
    if (passthrough != null) m['passthrough'] = passthrough;
    return m;
  }
}