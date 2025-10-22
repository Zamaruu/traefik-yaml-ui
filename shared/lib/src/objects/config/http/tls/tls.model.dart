import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/tls/tls.domain.model.dart';
import 'package:traefik_frontend_shared/src/objects/config/http/tls/tls.options.model.dart';

part 'tls.model.g.dart';

@JsonSerializable()
class Tls {
  /// The name of the certificate resolver to use for automatic certificate generation
  final String? certresolver;

  /// The name of the TLS options to use for configuring TLS parameters (cipher suites, min/max TLS version, client authentication, etc.)
  final List<TlsOption> options;

  /// List of domains and Subject Alternative Names (SANs) for explicit certificate domain specification.
  /// When using ACME certificate resolvers, domains are automatically extracted from router rules, making this option optional.
  final List<TlsDomain> domains;

  const Tls({
    this.certresolver,
    this.options = const [],
    this.domains = const [],
  });

  Map<String, dynamic> toJson() => _$TlsToJson(this);

  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);
}
