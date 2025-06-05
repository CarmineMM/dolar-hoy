import 'package:bloc/bloc.dart';
import 'package:dolar_hoy/domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

part 'page_state.dart';

enum PagesConvertion {
  criptodolar(
    'criptodolar',
    'CriptoDolar',
    'https://github.com/fcoagz/api-pydolarvenezuela/raw/docker/assets/pages/BCV.png?raw=true',
  ),
  monitor(
    'alcambio',
    'Al Cambio',
    'https://github.com/fcoagz/api-pydolarvenezuela/raw/docker/assets/pages/AlCambio.png?raw=true',
  ),
  zoom(
    'zoom',
    'Zoom',
    'https://github.com/fcoagz/api-pydolarvenezuela/raw/docker/assets/pages/zoom.png?raw=true',
  ),
  italcambio(
    'italcambio',
    'Italcambio',
    'https://github.com/fcoagz/api-pydolarvenezuela/raw/docker/assets/pages/Italcambio.png?raw=true',
  ),
  bcv(
    'bcv',
    'BCV',
    'https://github.com/fcoagz/api-pydolarvenezuela/raw/docker/assets/pages/BCV.png?raw=true',
  );

  // Campos para almacenar los valores
  final String value;
  final String description;
  final String imageUrl;

  const PagesConvertion(this.value, this.description, this.imageUrl);
}

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState());

  void setPage(PagesConvertion page) => emit(state.copyWith(page: page));

  void changeCurrency(CurrencyApi currency) => emit(state.copyWith(currency: currency));
}
