import 'package:json_annotation/json_annotation.dart';
import 'package:traefik_frontend_shared/src/converter/stacktrace.converter.dart';
import 'package:traefik_frontend_shared/src/objects/core/base.model.dart';

part 'apierror.model.g.dart';

@JsonSerializable()
class ApiError extends BaseModel {
  final String logUuid;

  final String error;

  @StackTraceConverter()
  final StackTrace? stackTrace;

  const ApiError({required this.logUuid, required this.error, this.stackTrace});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
