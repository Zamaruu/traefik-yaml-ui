import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treafik_frontend_ui/src/data/objects/config/configroot.model.dart';

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
