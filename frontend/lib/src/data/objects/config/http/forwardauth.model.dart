import 'package:json_annotation/json_annotation.dart';

part 'forwardauth.model.g.dart';

@JsonSerializable()
class ForwardAuth {
  String? address;
  bool? trustForwardHeader;

  ForwardAuth({this.address, this.trustForwardHeader});

  Map<String, dynamic> toJson() => _$ForwardAuthToJson(this);

  factory ForwardAuth.fromJson(Map<String, dynamic> json) => _$ForwardAuthFromJson(json);
}
