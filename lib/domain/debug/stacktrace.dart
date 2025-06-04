class StackTrace {
  static final StackTrace _instance = StackTrace._internal();
  final List<String> _messages = [];

  // Factory constructor para usar el patrón singleton
  factory StackTrace() {
    return _instance;
  }

  StackTrace._internal();

  // Añadir un mensaje al log
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    _messages.add('[$timestamp] $message');
    // Opcional: puedes limitar el tamaño del historial
    if (_messages.length > 100) {
      _messages.removeAt(0);
    }
  }

  // Obtener todos los mensajes
  List<String> get messages => List.unmodifiable(_messages);

  // Limpiar todos los mensajes
  void clear() {
    _messages.clear();
  }

  // Obtener los últimos N mensajes
  List<String> getLastMessages(int count) {
    if (count >= _messages.length) {
      return List.unmodifiable(_messages);
    }
    return List.unmodifiable(_messages.sublist(_messages.length - count));
  }

  // Para depuración: imprimir todos los mensajes
  @override
  String toString() {
    return _messages.join('\n');
  }
}

// Extensión para facilitar el uso
extension StackTraceExtension on String {
  void log() {
    StackTrace().log(this);
  }
}
