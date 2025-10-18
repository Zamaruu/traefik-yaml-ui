import 'dart:convert';
import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

class ConfigService {
  final String configPath;

  ConfigService({String? configPath}) : configPath = configPath ?? path.join('sample_traefik_config.yaml');

  /// Liest YAML ein und gibt als JSON Map zurück
  Future<Map<String, dynamic>> loadConfig() async {
    final file = File(configPath);
    if (!await file.exists()) {
      throw Exception('Config file not found at $configPath');
    }

    final content = await file.readAsString();
    final yamlData = loadYaml(content);

    // YAML → Map<String, dynamic>
    final jsonData = jsonDecode(jsonEncode(yamlData));
    return jsonData as Map<String, dynamic>;
  }
}
