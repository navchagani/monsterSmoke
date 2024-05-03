part of 'sign_in_bloc_bloc.dart';

sealed class SignInBlocEvent extends Equatable {
  const SignInBlocEvent();

  @override
  List<Object> get props => [];
}

class SignInInitialEvent extends SignInBlocEvent {}

class SignInEvent extends SignInBlocEvent {
  final String email, password;

  const SignInEvent({required this.email, required this.password});
}
