import 'package:json_annotation/json_annotation.dart';

part 'server.model.g.dart';

@JsonSerializable()
class Server {
  final String? url;

  final bool? preservePath;

  final int? weight;

  const Server({
    this.url,
    this.preservePath,
    this.weight,
  });

  Map<String, dynamic> toJson() => _$ServerToJson(this);

  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

  // --------------------------------------------------------------------------
  // Getter

  bool get hasUrl => url != null;
}
