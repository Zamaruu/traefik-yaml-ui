import 'package:json_annotation/json_annotation.dart';

part 'servertransport.model.g.dart';

@JsonSerializable()
class ServerTransport {
  final String? name;
  final bool? insecureSkipVerify;

  const ServerTransport({this.name, this.insecureSkipVerify});

  factory ServerTransport.fromJson(Map<String, dynamic> json) => _$ServerTransportFromJson(json);

  Map<String, dynamic> toJson() => _$ServerTransportToJson(this);
}
