import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';

part 'sign_up_bloc_event.dart';
part 'sign_up_bloc_state.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  final CaseSignUp caseSignUp;
  SignUpBloc(this.caseSignUp) : super(SignUpBlocInitial()) {
    on<SignUpInitialEvent>(initial);
    on<SignUpEvent>(signUp);
  }

  FutureOr<void> initial(
      SignUpInitialEvent event, Emitter<SignUpBlocState> emit) {
    emit(SignUpBlocInitial());
  }

  Future<FutureOr<void>> signUp(
      SignUpEvent event, Emitter<SignUpBlocState> emit) async {
    emit(SignUpLoadingState());
    final data = await caseSignUp.call(customerModel: event.customerModel);

    if (data is SuccessState) {
      emit(SignUpCompletedState(customerModel: data.data!));
    }

    if (data is ErrorState) {
      emit(SignUpErrorState(error: data.error!));
    }
  }
}
