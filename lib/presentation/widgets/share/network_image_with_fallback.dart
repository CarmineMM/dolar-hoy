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
          return _buildErrorWidget('Error al cargar imágenes');
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingWidget();
        },
      );
    } catch (e, _) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image_outlined,
            size: (width ?? minWidth ?? 10) > 40 ? 40 : 12,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          (width ?? minWidth ?? 10) > 40
              ? Text(
                  message,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
