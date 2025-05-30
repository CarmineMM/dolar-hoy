import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/core/router/app_router.dart';
import 'package:dolar_hoy/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Environment.appName,
      debugShowCheckedModeBanner: Environment.debug,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
