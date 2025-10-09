import 'package:dotenv/dotenv.dart';

class Environment {
  Environment._(); // Privater Konstruktor

  static late final DotEnv _env;

  static Future<void> load() async {
    _env = DotEnv(includePlatformEnvironment: true)..load();
  }

  static int get port {
    return int.parse(_env['PORT'] ?? '3000');
  }
}