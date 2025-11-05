import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_shared/src/interfaces/identenum.interface.dart';

/// Representation of the different implementations a (loadbalander)-service
/// can provide for the http config.
///
/// For more details see: https://doc.traefik.io/traefik/reference/routing-configuration/http/load-balancing/service/
enum EHttpServiceType implements IIdentifiableEnum<EHttpServiceType> {
  loadBalancer(0),
  mirroring(1),
  roundrobin(2);

  @override
  final int id;

  const EHttpServiceType(this.id);

  /// Tries to parse string router parameter to int and get enum value by id.
  factory EHttpServiceType.fromPath(String? parameter) {
    if (parameter == null) {
      throw ArgumentError("Invalid parameter for EHttpServiceType-Enum : $parameter", "parameter");
    }

    final id = int.tryParse(parameter);
    if (id == null) {
      throw ArgumentError("Invalid id for EHttpServiceType-Enum : $parameter", "parameter");
    } else {
      return EHttpServiceType.getById(id);
    }
  }

  static EHttpServiceType getById(int id) {
    switch (id) {
      case 0:
        return loadBalancer;
      case 1:
        return mirroring;
      case 2:
        return roundrobin;
      default:
        throw ArgumentError("Invalid id for EHttpServiceType-Enum : $id", "id");
    }
  }
}
