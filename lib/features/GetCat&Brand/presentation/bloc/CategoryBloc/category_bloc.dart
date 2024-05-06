import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/usecases/cat&BrandUseCase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CaseGetCategories caseGetCategories;
  CategoryBloc(this.caseGetCategories) : super(CategoryInitial()) {
    on<CategoryInitialEvent>(initial);
    on<GetCategoryEvent>(getCategorys);
  }

  Future<FutureOr<void>> getCategorys(
      GetCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingCategory());
    final data =
        await caseGetCategories(buissnessTypeId: event.buissnessTypeId);

    if (data is SuccessState) {
      emit(CategoryCompletedCategory(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(CategoryErrorCategory(error: data.error!));
    }
  }

  FutureOr<void> initial(
      CategoryInitialEvent event, Emitter<CategoryState> emit) {
    emit(CategoryInitial());
  }
}
