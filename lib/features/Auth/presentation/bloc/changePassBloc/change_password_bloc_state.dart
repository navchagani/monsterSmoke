part of 'change_password_bloc_bloc.dart';

sealed class ChangePasswordBlocState extends Equatable {
  const ChangePasswordBlocState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordBlocInitial extends ChangePasswordBlocState {}

final class ChangePasswordLoadingState extends ChangePasswordBlocState {}

final class PasswordChangedState extends ChangePasswordBlocState {}

final class ChangePasswordErrorState extends ChangePasswordBlocState {
  final String? error;

  const ChangePasswordErrorState({required this.error});
}
