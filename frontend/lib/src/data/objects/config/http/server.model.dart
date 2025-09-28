import 'package:json_annotation/json_annotation.dart';

part 'server.model.g.dart';

@JsonSerializable()
class Server {
  final String? url;

  const Server({this.url});

  Map<String, dynamic> toJson() => _$ServerToJson(this);

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
}
