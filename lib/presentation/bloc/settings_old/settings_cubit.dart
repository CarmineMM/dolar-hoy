import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/monitor.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

/// Este setting solo contiene el monitor seleccionado
@Deprecated(
  'Ahora se centrara, el monitor, la moneda y la pagina seleccionada dentro de un Bloc, SettingBloc',
)
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(monitor: Monitor.empty()));

  /// Seleccionar un monitor en base a una lista de monitores.
  /// En primera instancia estará hardcode, en el futuro la idea es tener un algoritmo basado en las
  /// selecciones previas del usuario actual.
  void selectMonitorFromMonitorsList(List<Monitor> monitors) {
    emit(
      state.copyWith(
        monitor: monitors.firstWhere(
          (monitor) => monitor.name == 'bcv',
          orElse: () => monitors.first,
        ),
      ),
    );
  }

  /// Cambiar el monitor seleccionado
  void changeMonitor(Monitor monitor) {
    emit(state.copyWith(monitor: monitor));
  }
}
