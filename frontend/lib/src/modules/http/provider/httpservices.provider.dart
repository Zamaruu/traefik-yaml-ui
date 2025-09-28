import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/data/objects/config/http/httpservice.model.dart';
import 'package:frontend/src/modules/root/provider/rootconfig.provider.dart';

final httpServicesProvider = Provider<List<HttpService>>((ref) {
  final httpConfig = ref.watch(configRootProvider.select((cr) => cr.http));

  if (httpConfig == null) {
    return [];
  } else {
    final List<HttpService> services = httpConfig.services?.whereType<HttpService>().toList() ?? [];
    return services;
  }
});
