import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traefik_frontend_shared/shared_models.dart';

final configRootProvider = NotifierProvider<ConfigRootNotifier, ConfigRoot>(() {
  return ConfigRootNotifier();
});

class ConfigRootNotifier extends Notifier<ConfigRoot> {
  @override
  ConfigRoot build() {
    return const ConfigRoot();
  }

  void setConfig(ConfigRoot config) {
    state = config;
  }
}
