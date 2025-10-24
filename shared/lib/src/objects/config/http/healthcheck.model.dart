import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/converter/duration.converter.dart';

part 'healthcheck.model.g.dart';

@JsonSerializable()
class Healthcheck {
  /// Defines the server URL path for the health check endpoint.
  final String path;

  /// Replaces the server URL scheme for the health check endpoint.
  final String? scheme;

  /// If defined to grpc, will use the gRPC health check protocol to probe the server.
  /// Default: 'http'
  final String? mode;

  /// Defines the value of hostname in the Host header of the health check request.
  final String? hostname;

  /// Replaces the server URL port for the health check endpoint.
  final int? port;

  /// Defines the frequency of the health check calls for healthy targets.
  /// Default: 30s
  @DurationConverter()
  final Duration? interval;

  /// Defines the frequency of the health check calls for unhealthy targets.
  /// Defaults to [interval] when not set.
  @DurationConverter()
  final Duration? unhealthyInterval;

  /// Defines the maximum duration Traefik will wait for a health check request.
  /// Default: 5s
  @DurationConverter()
  final Duration? timeout;

  /// Defines custom headers to be sent to the health check endpoint.
  final Map<String, String>? headers;

  /// Defines whether redirects should be followed during the health check calls.
  /// Default: true
  final bool? followRedirects;

  /// Defines the HTTP method that will be used while connecting to the endpoint.
  /// Default: GET
  final String? method;

  /// Defines the expected HTTP status code of the response to the health check request.
  final int? status;

  Healthcheck({
    required this.path,
    this.scheme,
    this.mode,
    this.hostname,
    this.port,
    this.interval,
    this.unhealthyInterval,
    this.timeout,
    this.headers,
    this.followRedirects,
    this.method,
    this.status,
  });
  factory Healthcheck.fromJson(Map<String, dynamic> json) => _$HealthcheckFromJson(json);

  Map<String, dynamic> toJson() => _$HealthcheckToJson(this);
}
