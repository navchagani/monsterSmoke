import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';

part 'change_password_bloc_event.dart';
part 'change_password_bloc_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordBlocEvent, ChangePasswordBlocState> {
  final CaseChangePassword caseChangePassword;
  final CaseForgotPass forgotPass;
  ChangePasswordBloc(this.caseChangePassword, this.forgotPass)
      : super(ChangePasswordBlocInitial()) {
    on<ChangePasswordBlocInitialEvent>(initial);
    on<ChangePasswordEvent>(changePassword);
    on<ForgotPasswordEvent>(forgotPassword);
  }

  FutureOr<void> initial(ChangePasswordBlocInitialEvent event,
      Emitter<ChangePasswordBlocState> emit) {}

  Future<FutureOr<void>> changePassword(
      ChangePasswordEvent event, Emitter<ChangePasswordBlocState> emit) async {
    emit(ChangePasswordLoadingState());

    final data = await caseChangePassword(
        confirmPassword: event.confirmPassword,
        password: event.password,
        oldPassword: event.oldPassword);

    if (data is SuccessState) {
      emit(PasswordChangedState());
    }

    if (data is ErrorState) {
      emit(ChangePasswordErrorState(error: data.error?.message));
    }
  }

  Future<FutureOr<void>> forgotPassword(
      ForgotPasswordEvent event, Emitter<ChangePasswordBlocState> emit) async {
    emit(ChangePasswordLoadingState());

    final data = await forgotPass(
      email: event.email,
    );

    if (data is SuccessState) {
      emit(PasswordChangedState());
    }

    if (data is ErrorState) {
      emit(ChangePasswordErrorState(error: data.error?.message));
    }
  }
}
