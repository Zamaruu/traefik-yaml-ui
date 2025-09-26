import 'package:frontend/src/data/enums/response.enum.dart';
import 'package:frontend/src/data/interfaces/core/response.interface.dart';

class BaseResponse implements IResponse {
  @override
  final EResponseStatus status;

  @override
  final String message;

  @override
  final Object? exception;

  @override
  final StackTrace? stackTrace;

  // --------------------------------------------------------------------
  // Konstruktor

  const BaseResponse({
    required this.status,
    this.message = "",
    this.exception,
    this.stackTrace,
  });

  const BaseResponse.success({
    this.message = "",
    this.exception,
    this.stackTrace,
  }) : status = EResponseStatus.success;

  const BaseResponse.error({
    this.message = "",
    this.exception,
    this.stackTrace,
  }) : status = EResponseStatus.error;

  factory BaseResponse.fromMultiple(List<IResponse> responses) {
    final allSuccessful = responses.every((r) => r.isSuccess);

    if (allSuccessful) {
      return const BaseResponse.success();
    } else {
      final errors = responses.where((r) => r.isFailure).map((r) => r.message).join(", ");
      return BaseResponse.error(message: errors);
    }
  }

  // --------------------------------------------------------------------
  // Status-Getter

  @override
  bool get isSuccess => status == EResponseStatus.success;

  @override
  bool get isFailure => status == EResponseStatus.error;
}
