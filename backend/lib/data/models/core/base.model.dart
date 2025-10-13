import 'dart:convert';

import 'package:backend/data/interfaces/serializable.interface.dart';

abstract class BaseModel implements ISerializable {
  const BaseModel();

  String get asEncodedJson => jsonEncode(toJson());
}
