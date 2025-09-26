import 'package:frontend/src/data/interfaces/core/response.interface.dart';
import 'package:frontend/src/data/objects/core/response/response.model.dart';

class ValueResponse<T extends Object> extends BaseResponse implements IValueResponse<T> {
  @override
  final T? value;

  ValueResponse({
    required super.status,
    super.exception,
    super.message,
    super.stackTrace,
    this.value,
  });

  ValueResponse.success({
    this.value,
    super.exception,
    super.message,
    super.stackTrace,
  }) : super.success();

  ValueResponse.error({
    this.value,
    super.exception,
    super.message,
    super.stackTrace,
  }) : super.error();

  // --------------------------------------------------------------------
  // Getter

  @override
  bool get hasValue => value != null;
}
