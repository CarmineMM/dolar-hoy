import 'package:flutter/material.dart';

class NetworkImageWithFallback extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? minWidth;
  final double? minHeight;
  final Map<String, String>? headers; // Para incluir headers si es necesario

  const NetworkImageWithFallback(
    this.imageUrl, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.minWidth,
    this.minHeight,
    this.headers,
  });

  @override
  Widget build(BuildContext context) {
    try {
      // Verificar si la URL es válida
      final uri = Uri.tryParse(imageUrl);
      if (uri == null || !uri.hasScheme) {
        debugPrint('URL de imagen no válida: $imageUrl');
        return _buildErrorWidget('URL inválida');
      }

      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        headers: headers,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error al cargar la imagen: $error');
          debugPrint('URL de la imagen: $imageUrl');
          debugPrint(stackTrace?.toString() ?? 'No hay stacktrace');
          return _buildErrorWidget('Error al cargar imágenes');
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingWidget();
        },
      );
    } catch (e, stackTrace) {
      debugPrint('Excepción al cargar la imagen: $e');
      debugPrint(stackTrace.toString());
      return _buildErrorWidget('Error');
    }
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      width: width ?? minWidth,
      height: height ?? minHeight,
      child: const Center(
        child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return SizedBox(
      width: width ?? minWidth,
      height: height ?? minHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
          const SizedBox(height: 8),
          Text(
            message,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
