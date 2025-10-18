import 'dart:convert';

import 'package:shared_models/shared_models.dart';

abstract class BaseModel implements ISerializable {
  const BaseModel();

  String get asEncodedJson => jsonEncode(toJson());
}
