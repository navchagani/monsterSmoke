part of 'change_password_bloc_bloc.dart';

sealed class ChangePasswordBlocEvent extends Equatable {
  const ChangePasswordBlocEvent();

  @override
  List<Object> get props => [];
}

class ChangePasswordBlocInitialEvent extends ChangePasswordBlocEvent {}

class ChangePasswordEvent extends ChangePasswordBlocEvent {
  final String? oldPassword, password, confirmPassword;

  const ChangePasswordEvent(
      {required this.oldPassword,
      required this.password,
      required this.confirmPassword});
}

class ForgotPasswordEvent extends ChangePasswordBlocEvent {
  final String? email;

  const ForgotPasswordEvent({
    required this.email,
  });
}
