import 'package:json_annotation/json_annotation.dart';
import 'package:shared_models/src/objects/core/base.model.dart';

part 'apierror.model.g.dart';

String _stackTraceToJson(StackTrace? stackTrace) {
  return stackTrace.toString();
}

@JsonSerializable()
class ApiError extends BaseModel {
  final String logUuid;

  final String error;

  @JsonKey(toJson: _stackTraceToJson, includeFromJson: false)
  final StackTrace? stackTrace;

  const ApiError({required this.logUuid, required this.error, this.stackTrace});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
