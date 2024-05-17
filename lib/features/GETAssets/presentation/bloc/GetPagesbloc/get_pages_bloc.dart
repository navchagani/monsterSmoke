import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/htmlModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'get_pages_event.dart';
part 'get_pages_state.dart';

class GetPagesBloc extends Bloc<GetPagesEvent, GetPagesState> {
  final CaseGetPage caseGetPage;
  GetPagesBloc(this.caseGetPage) : super(GetPagesInitial()) {
    on<GetPagesInitialEvent>(initial);
    on<GetPageEvent>(getGetPagess);
  }

  Future<FutureOr<void>> getGetPagess(
      GetPageEvent event, Emitter<GetPagesState> emit) async {
    emit(GetPagesLoadingState());
    final data = await caseGetPage(alias: event.alias);

    if (data is SuccessState) {
      emit(GetPagesCompletedState(htmlModel: data.data!));
    }

    if (data is ErrorState) {
      emit(GetPagesErrorState(error: data.error!));
    }
  }

  FutureOr<void> initial(
      GetPagesInitialEvent event, Emitter<GetPagesState> emit) {
    emit(GetPagesInitial());
  }
}
