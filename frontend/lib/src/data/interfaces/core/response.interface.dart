import 'package:frontend/src/data/enums/response.enum.dart';

abstract interface class IResponse {
  EResponseStatus get status;

  /// Z.B. Nachricht einer Exception
  String get message;

  Object? get exception;

  StackTrace? get stackTrace;

  // --------------------------------------------------------------------
  // Status-Getter

  bool get isSuccess;

  bool get isFailure;
}

abstract interface class IValueResponse<T extends Object> implements IResponse {
  T? get value;

  bool get hasValue;
}
