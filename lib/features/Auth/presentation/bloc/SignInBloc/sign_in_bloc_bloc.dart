import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  final CaseSignIn caseSignIn;
  SignInBloc(this.caseSignIn) : super(SignInBlocInitial()) {
    on<SignInInitialEvent>(initial);
    on<SignInEvent>(signIn);
  }

  FutureOr<void> initial(
      SignInInitialEvent event, Emitter<SignInBlocState> emit) {
    emit(SignInBlocInitial());
  }

  Future<FutureOr<void>> signIn(
      SignInEvent event, Emitter<SignInBlocState> emit) async {
    emit(SignInLoadingState());
    final data =
        await caseSignIn.call(email: event.email, password: event.password);

    if (data is SuccessState) {
      emit(SignInCompletedState(token: data.data!));
    }

    if (data is ErrorState) {
      emit(SignInErrorState(error: data.error!));
    }
  }
}
