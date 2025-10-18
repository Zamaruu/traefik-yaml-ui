import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_models/shared_models.dart';
import 'package:treafik_frontend_ui/src/modules/root/provider/rootconfig.provider.dart';

final httpServicesProvider = Provider<List<HttpService>>((ref) {
  final httpConfig = ref.watch(configRootProvider.select((cr) => cr.http));

  if (httpConfig == null) {
    return [];
  } else {
    final List<HttpService> services = httpConfig.services.whereType<HttpService>().toList();
    return services;
  }
});
