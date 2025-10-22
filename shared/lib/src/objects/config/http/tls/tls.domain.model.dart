import 'package:json_annotation/json_annotation.dart';

part 'tls.domain.model.g.dart';

@JsonSerializable()
class TlsDomain {
  final String main;

  final List<String> sans;

  const TlsDomain({this.main = "", this.sans = const []});

  factory TlsDomain.fromJson(Map<String, dynamic> json) => _$TlsDomainFromJson(json);

  Map<String, dynamic> toJson() => _$TlsDomainToJson(this);
}
