import 'package:json_annotation/json_annotation.dart';

part 'ipallowlist.model.g.dart';

@JsonSerializable()
class IpAllowList {
  final List<String> sourceRange;

  const IpAllowList({
    this.sourceRange = const [],
  });

  factory IpAllowList.fromJson(Map<String, dynamic> json) => _$IpAllowListFromJson(json);

  Map<String, dynamic> toJson() => _$IpAllowListToJson(this);
}
