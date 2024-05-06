import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'country_bloc_event.dart';
part 'country_bloc_state.dart';

class CountryBloc extends Bloc<CountryBlocEvent, CountryBlocState> {
  final CaseGetCountries caseGetCountries;
  CountryBloc(this.caseGetCountries) : super(CountryBlocInitial()) {
    on<CountryInitialEvent>(initial);
    on<GetCountryEvent>(getCountrys);
  }

  Future<FutureOr<void>> getCountrys(
      GetCountryEvent event, Emitter<CountryBlocState> emit) async {
    emit(CountryLoadingCountry());
    final data = await caseGetCountries();

    if (data is SuccessState) {
      emit(CountryCompletedCountry(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(CountryErrorCountry(error: data.error!));
    }
  }

  FutureOr<void> initial(
      CountryInitialEvent event, Emitter<CountryBlocState> emit) {
    emit(CountryBlocInitial());
  }
}
