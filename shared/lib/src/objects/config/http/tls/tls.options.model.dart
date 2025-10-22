import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/objects/core/nameable.model.dart';

part 'tls.options.model.g.dart';

/// https://doc.traefik.io/traefik/reference/routing-configuration/http/tls/tls-options/
@JsonSerializable()
class TlsOption extends NameableModel {
  final String? minVersion;
  final String? maxVersion;
  final List<String> cipherSuites;
  final List<String> curvePreferences;
  final bool? sniStrict;
  final List<String> alpnProtocols;
  final bool? disableSessionTickets;

  const TlsOption({
    super.name,
    this.minVersion,
    this.maxVersion,
    this.cipherSuites = const [],
    this.curvePreferences = const [],
    this.sniStrict,
    this.alpnProtocols = const [],
    this.disableSessionTickets,
  });

  factory TlsOption.fromJson(Map<String, dynamic> json) => _$TlsOptionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TlsOptionToJson(this);
}
