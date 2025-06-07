import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = 'about';
  static const String routePath = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Términos y Condiciones de Uso',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Fecha de Última Actualización: 7 de junio de 2025',
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          _buildSection(
            title: '1. Propósito de la Aplicación',
            content:
                'La Aplicación ${Environment.appName} ha sido desarrollada con el objetivo de recopilar y comparar datos de diversas fuentes de información públicas y de terceros relacionadas con tipos de cambio y precios de monitores en Venezuela.\n\nLa Aplicación no es una fuente oficial de información cambiaría ni financiera. Su función principal es servir como una herramienta de referencia y comparación, presentando datos agregados y procesados de fuentes externas.',
          ),
          _buildSection(
            title: '2. Exclusión de Responsabilidad',
            content:
                '• Precisión y Actualización de Datos: Los datos mostrados en la Aplicación son obtenidos de fuentes de terceros y pueden no ser exactos, completos, actualizados o fiables en todo momento debido a la volatilidad inherente del mercado y la naturaleza de las fuentes consultadas. El desarrollador de la Aplicación no garantiza la precisión, fiabilidad o actualidad de la información proporcionada.\n\n• Decisiones Financieras: La información contenida en esta Aplicación no debe ser considerada como asesoramiento financiero, de inversión, legal o fiscal. El Usuario es el único responsable de sus decisiones financieras. Cualquier acción tomada basándose en la información de esta Aplicación es bajo su propio riesgo y responsabilidad.\n\n• Fuentes Externas: La Aplicación depende de la disponibilidad y la fiabilidad de las fuentes de datos externas. El desarrollador no es responsable por interrupciones en el servicio, errores en los datos o cualquier otro problema que surja de la conexión o el procesamiento de datos de estas fuentes.\n\n• Uso Personal y Exclusivo: Esta Aplicación está diseñada para uso personal y comparativo exclusivamente. No está destinada para fines comerciales, de especulación financiera, o para la difusión pública de tasas cambiarías. El uso de la Aplicación para cualquier propósito distinto al personal y comparativo es responsabilidad exclusiva del Usuario.',
          ),
          _buildSection(
            title: '3. Modificaciones de los Términos',
            content:
                'Nos reservamos el derecho de modificar estos Términos y Condiciones en cualquier momento. Cualquier cambio será efectivo inmediatamente después de su publicación en la Aplicación. Se recomienda al Usuario revisar estos Términos periódicamente para estar al tanto de cualquier actualización. El uso continuado de la Aplicación después de la publicación de los cambios constituye la aceptación de los mismos.',
          ),
          _buildSection(
            title: '4. Contacto',
            content:
                'Si tiene alguna pregunta o inquietud sobre estos Términos y Condiciones, puede contactar al desarrollador a través de ---.',
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(content, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
