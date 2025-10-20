import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:traefik_frontend_ui/src/modules/root/provider/rootconfig.provider.dart';

final httpRouterProvider = Provider<List<HttpRouter>>((ref) {
  final httpConfig = ref.watch(configRootProvider.select((cr) => cr.http));

  if (httpConfig == null) {
    return [];
  } else {
    final List<HttpRouter> routers = httpConfig.routers.whereType<HttpRouter>().toList();
    return routers;
  }
});
