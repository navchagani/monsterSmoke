import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';

part 'change_password_bloc_event.dart';
part 'change_password_bloc_state.dart';

class ChangePasswordBlocBloc
    extends Bloc<ChangePasswordBlocEvent, ChangePasswordBlocState> {
  final CaseChangePassword caseChangePassword;
  ChangePasswordBlocBloc(this.caseChangePassword)
      : super(ChangePasswordBlocInitial()) {
    on<ChangePasswordBlocInitialEvent>(initial);
    on<ChangePasswordEvent>(changePassword);
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
}
