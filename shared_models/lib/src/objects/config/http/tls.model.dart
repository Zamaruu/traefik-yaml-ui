import 'package:json_annotation/json_annotation.dart';

part 'tls.model.g.dart';

@JsonSerializable()
class Tls {
  final String? certresolver;

  const Tls({this.certresolver});

  Map<String, dynamic> toJson() => _$TlsToJson(this);

  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);
}
