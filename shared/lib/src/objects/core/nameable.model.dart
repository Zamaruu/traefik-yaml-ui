import 'package:traefik_frontend_shared/src/objects/core/base.model.dart';

abstract class NameableModel extends BaseModel {
  final String name;

  const NameableModel({this.name = ""});
}
