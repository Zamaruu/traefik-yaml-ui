import 'package:json_annotation/json_annotation.dart';

part 'mirror.model.g.dart';

/// Represents the Traefik "mirroring" configuration for a service.
///
/// Example:
/// ```yaml
/// mirroring:
///   service: appv1
///   mirrorBody: false
///   maxBodySize: 1024
///   mirrors:
///     - name: appv2
///       percent: 10
/// ```
@JsonSerializable(explicitToJson: true)
class Mirroring {
  /// The main (primary) service to which requests are originally sent.
  final String service;

  /// Whether the request body should be mirrored.
  /// Default: true
  final bool? mirrorBody;

  /// The maximum size (in bytes) allowed for the request body to be mirrored.
  /// If the body is larger, the request is not mirrored.
  /// Default: -1 (unlimited)
  final int? maxBodySize;

  /// List of mirror target services and their respective traffic percentages.
  final List<MirrorService>? mirrors;

  Mirroring({
    required this.service,
    this.mirrorBody,
    this.maxBodySize,
    this.mirrors,
  });

  factory Mirroring.fromJson(Map<String, dynamic> json) => _$MirroringFromJson(json);

  Map<String, dynamic> toJson() => _$MirroringToJson(this);
}

/// Represents a single mirror target service and its configuration.
@JsonSerializable()
class MirrorService {
  /// Name of the mirror target service.
  final String name;

  /// Percentage of requests that should be mirrored to this service.
  /// Default: 0 (no traffic mirrored)
  final int? percent;

  MirrorService({
    required this.name,
    this.percent,
  });

  factory MirrorService.fromJson(Map<String, dynamic> json) => _$MirrorServiceFromJson(json);

  Map<String, dynamic> toJson() => _$MirrorServiceToJson(this);
}
