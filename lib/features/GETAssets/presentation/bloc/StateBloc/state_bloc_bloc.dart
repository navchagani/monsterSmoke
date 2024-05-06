import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'state_bloc_event.dart';
part 'state_bloc_state.dart';

class StateBloc extends Bloc<StateBlocEvent, StateBlocState> {
  final CaseGetStates caseGetCountries;
  StateBloc(this.caseGetCountries) : super(StateBlocInitial()) {
    on<StateInitialEvent>(initial);
    on<GetStateEvent>(getStates);
  }

  Future<FutureOr<void>> getStates(
      GetStateEvent event, Emitter<StateBlocState> emit) async {
    emit(StateLoadingState());
    final data = await caseGetCountries.call(stateId: event.stateId);

    if (data is SuccessState) {
      emit(StateCompletedState(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(StateErrorState(error: data.error!));
    }
  }

  FutureOr<void> initial(
      StateInitialEvent event, Emitter<StateBlocState> emit) {
    emit(StateBlocInitial());
  }
}
