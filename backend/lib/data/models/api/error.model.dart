import 'package:backend/data/models/core/base.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.model.g.dart';

String _stackTraceToJson(StackTrace? stackTrace) {
  return stackTrace.toString();
}

@JsonSerializable()
class Error extends BaseModel {
  final String logUuid;

  final String error;

  @JsonKey(toJson: _stackTraceToJson, includeFromJson: false)
  final StackTrace? stackTrace;

  const Error({required this.logUuid, required this.error, this.stackTrace});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
