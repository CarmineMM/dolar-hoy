import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Variables de entorno que vienen del .env
class Environment {
  static get appName => dotenv.get('APP_NAME', fallback: 'Dolar Hoy');
  static get debug => dotenv.getBool('APP_DEBUG', fallback: false);
}
