import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/BrandModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/usecases/cat&BrandUseCase.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final CaseGetBrands caseGetBrands;
  BrandBloc(this.caseGetBrands) : super(BrandInitial()) {
    on<BrandInitialEvent>(initial);
    on<GetBrandEvent>(getBrands);
  }

  Future<FutureOr<void>> getBrands(
      GetBrandEvent event, Emitter<BrandState> emit) async {
    emit(BrandLoadingBrand());
    final data = await caseGetBrands();

    if (data is SuccessState) {
      emit(BrandCompletedBrand(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(BrandErrorBrand(error: data.error!));
    }
  }

  FutureOr<void> initial(BrandInitialEvent event, Emitter<BrandState> emit) {
    emit(BrandInitial());
  }
}
