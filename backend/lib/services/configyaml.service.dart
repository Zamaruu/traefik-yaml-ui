import 'dart:convert';
import 'dart:io';
import 'package:traefik_frontend_shared/shared_models.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart' as path;

class ConfigService {
  final String configPath;

  ConfigService({
    String? configPath,
  }) : configPath = configPath ?? path.join('store/sample_traefik_config.yaml');

  /// Liest YAML ein und gibt als JSON Map zurück
  Future<ConfigRoot> loadConfig() async {
    final Directory currentDirectory = Directory.current;
    final String configPath = path.join(currentDirectory.path, this.configPath);
    final file = File(configPath);

    final yamlData = await readYamlContent(file);

    final parsedConfig = await parseYaml(yamlData);

    return parsedConfig;
  }

  Future<JsonMap> readYamlContent(File file) async {
    if (!await file.exists()) {
      throw Exception('Config file not found at $configPath');
    }

    final content = file.readAsStringSync();

    final yamlData = loadYaml(content);
    final jsonData = jsonDecode(jsonEncode(yamlData));

    return jsonData;
  }

  Future<ConfigRoot> parseYaml(JsonMap yamlData) async {
    final http = yamlData['http'] as Map<String, dynamic>? ?? {};

    List<Middleware> middlewares = [];
    List<ServerTransport> serversTransports = [];
    List<HttpService> services = [];
    List<HttpRouter> routers = [];

    // Middlewares
    final rawMiddlewares = http['middlewares'] as Map<String, dynamic>? ?? {};
    middlewares = rawMiddlewares.entries.map((e) {
      final value = Map<String, dynamic>.from(e.value);
      value['name'] = e.key;
      return Middleware.fromJson(value);
    }).toList();

    // ServersTransports
    final rawTransports = http['serversTransports'] as Map<String, dynamic>? ?? {};
    serversTransports = rawTransports.entries.map((e) {
      final value = Map<String, dynamic>.from(e.value);
      value['name'] = e.key;
      return ServerTransport.fromJson(value);
    }).toList();

    // Services
    final rawServices = http['services'] as Map<String, dynamic>? ?? {};
    services = rawServices.entries.map((e) {
      final value = Map<String, dynamic>.from(e.value);
      value['name'] = e.key;
      return HttpService.fromJson(value);
    }).toList();

    // Routers
    final rawRouters = http['routers'] as Map<String, dynamic>? ?? {};
    routers = rawRouters.entries.map((e) {
      final value = Map<String, dynamic>.from(e.value);
      value['name'] = e.key;
      return HttpRouter.fromJson(value);
    }).toList();

    final traefikConfig = ConfigRoot(
      http: Http(
        middlewares: middlewares,
        serversTransports: serversTransports,
        services: services,
        routers: routers,
      ),
    );

    return traefikConfig;
  }
}
