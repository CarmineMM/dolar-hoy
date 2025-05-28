import 'package:dio/dio.dart';
import 'package:dolar_hoy/core/network/adapters/http_client.dart';

/// El implementador manda a llamar los endpoint según acciones,
/// o métodos HTTP. A su vez se encargar de disparar acciones de los interceptores
/// Preferiblemente usar los implementadores a usar los clientes directamente.
class HttpImplementer {
  /// Peticiones Get al connector
  static Future<Response<T>> get<T>(
    String connection,
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    final httpClient = HttpClient.instance(connection);

    // Implementar los Interceptores

    return httpClient.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
