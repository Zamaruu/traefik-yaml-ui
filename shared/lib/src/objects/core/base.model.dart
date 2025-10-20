import 'dart:convert';

import 'package:traefik_frontend_shared/shared_models.dart';

abstract class BaseModel implements ISerializable {
  const BaseModel();

  String get asEncodedJson => jsonEncode(toJson());
}
