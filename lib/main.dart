import 'package:dolar_hoy/core/constants/environment.dart';
import 'package:dolar_hoy/core/router/app_router.dart';
import 'package:dolar_hoy/core/theme/app_theme.dart';
import 'package:dolar_hoy/infrastructure/datasources/monitor_py_dolarve_datasource.dart';
import 'package:dolar_hoy/infrastructure/repositories/monitor_repository_impl.dart';
import 'package:dolar_hoy/presentation/bloc/convert/convert_cubit.dart';
import 'package:dolar_hoy/presentation/bloc/monitor/monitor_bloc.dart';
import 'package:dolar_hoy/presentation/bloc/setting/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingBloc()),
        BlocProvider(
          create: (context) =>
              MonitorBloc(repository: MonitorRepositoryImpl(MonitorPyDolarVeDatasource())),
        ),
        BlocProvider(create: (context) => ConvertCubit(settingBloc: context.read<SettingBloc>())),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Environment.appName,
      debugShowCheckedModeBanner: Environment.debug,
      theme: AppTheme().getTheme(isDarkMode: false),
      routerConfig: appRouter,
    );
  }
}
