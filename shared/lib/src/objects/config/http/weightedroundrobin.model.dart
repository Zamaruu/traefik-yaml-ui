import 'package:json_annotation/json_annotation.dart';

part 'weightedroundrobin.model.g.dart';

/// Represents the "weighted" load balancing configuration in Traefik.
///
/// Example:
/// ```yaml
/// weighted:
///   services:
///     - name: appv1
///       weight: 3
///     - name: appv2
///       weight: 1
/// ```
@JsonSerializable()
class WeightedRoundRobin {
  /// List of weighted services participating in load balancing.
  final List<WeightedService> services;

  const WeightedRoundRobin({
    required this.services,
  });

  factory WeightedRoundRobin.fromJson(Map<String, dynamic> json) => _$WeightedRoundRobinFromJson(json);

  Map<String, dynamic> toJson() => _$WeightedRoundRobinToJson(this);
}

/// Represents one service entry with an associated weight in a WRR configuration.
@JsonSerializable()
class WeightedService {
  /// Name of the service (refers to another defined service).
  final String name;

  /// Relative weight of the service.
  /// Determines how frequently this service is selected.
  /// Higher values mean more traffic.
  final int weight;

  WeightedService({
    required this.name,
    required this.weight,
  });

  factory WeightedService.fromJson(Map<String, dynamic> json) => _$WeightedServiceFromJson(json);

  Map<String, dynamic> toJson() => _$WeightedServiceToJson(this);
}
