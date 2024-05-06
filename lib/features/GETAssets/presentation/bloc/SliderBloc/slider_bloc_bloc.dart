import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'slider_bloc_event.dart';
part 'slider_bloc_state.dart';

class SliderBloc extends Bloc<SliderBlocEvent, SliderBlocState> {
  final CaseGetSliders caseGetSlider;
  SliderBloc(this.caseGetSlider) : super(SliderBlocInitial()) {
    on<SliderInitialEvent>(initial);
    on<GetSliderEvent>(getSliders);
  }

  Future<FutureOr<void>> getSliders(
      GetSliderEvent event, Emitter<SliderBlocState> emit) async {
    emit(SliderLoadingSlider());
    final data = await caseGetSlider();

    if (data is SuccessState) {
      emit(SliderCompletedSlider(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(SliderErrorSlider(error: data.error!));
    }
  }

  FutureOr<void> initial(
      SliderInitialEvent event, Emitter<SliderBlocState> emit) {
    emit(SliderBlocInitial());
  }
}
