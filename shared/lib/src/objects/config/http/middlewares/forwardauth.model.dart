import 'package:json_annotation/json_annotation.dart';

part 'forwardauth.model.g.dart';

/// Represents the Traefik ForwardAuth middleware configuration.
///
/// The forwardAuth middleware delegates authentication to an external service.
/// If the service answers with a 2XX code, access is granted, and the original
/// request is performed. Otherwise, the authentication server's response is returned.
///
/// Example:
/// ```yaml
/// http:
///   middlewares:
///     test-auth:
///       forwardAuth:
///         address: "https://example.com/auth"
/// ```
@JsonSerializable(explicitToJson: true)
class ForwardAuth {
  /// Authentication server address.
  /// **Required**
  final String address;

  /// Trust all X-Forwarded-* headers.
  /// Default: false
  final bool? trustForwardHeader;

  /// Headers to copy from the authentication server response
  /// and set on forwarded request (replacing conflicting headers).
  final List<String>? authResponseHeaders;

  /// Regex to match headers to copy from the authentication server response.
  /// If set, all headers matching this regex are forwarded.
  final String? authResponseHeadersRegex;

  /// Headers from the request to copy to the authentication server request.
  /// If not set, all headers are passed.
  final List<String>? authRequestHeaders;

  /// Cookies to copy from the authentication server to the response,
  /// replacing conflicting cookies.
  final List<String>? addAuthCookiesToResponse;

  /// Send the request body to the authentication server.
  /// Default: false (note: breaks streaming)
  final bool? forwardBody;

  /// Limit the body size in bytes. Requests larger than this return 401.
  /// Default: -1 (no limit)
  final int? maxBodySize;

  /// Header field to store the authenticated user.
  final String? headerField;

  /// Forward Location header as-is instead of prefixing with auth server domain.
  /// Default: false
  final bool? preserveLocationHeader;

  /// Preserve the original request method while forwarding.
  /// Default: false
  final bool? preserveRequestMethod;

  /// TLS options for secure connection to the authentication server.
  final TlsOptions? tls;

  ForwardAuth({
    required this.address,
    this.trustForwardHeader,
    this.authResponseHeaders,
    this.authResponseHeadersRegex,
    this.authRequestHeaders,
    this.addAuthCookiesToResponse,
    this.forwardBody,
    this.maxBodySize,
    this.headerField,
    this.preserveLocationHeader,
    this.preserveRequestMethod,
    this.tls,
  });

  factory ForwardAuth.fromJson(Map<String, dynamic> json) => _$ForwardAuthFromJson(json);

  Map<String, dynamic> toJson() => _$ForwardAuthToJson(this);
}

/// TLS configuration for the ForwardAuth middleware.
@JsonSerializable()
class TlsOptions {
  /// Path to the certificate authority used for the secured connection.
  /// Defaults to system bundle.
  final String? ca;

  /// Path to the public certificate used for secure connection.
  final String? cert;

  /// Path to the private key used for secure connection.
  final String? key;

  /// Secret containing the CA used for secure connection (Kubernetes only).
  final String? caSecret;

  /// Secret containing both private and public certificates (Kubernetes only).
  final String? certSecret;

  /// If true, disables certificate verification.
  /// Default: false
  final bool? insecureSkipVerify;

  TlsOptions({
    this.ca,
    this.cert,
    this.key,
    this.caSecret,
    this.certSecret,
    this.insecureSkipVerify,
  });

  factory TlsOptions.fromJson(Map<String, dynamic> json) => _$TlsOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$TlsOptionsToJson(this);
}
