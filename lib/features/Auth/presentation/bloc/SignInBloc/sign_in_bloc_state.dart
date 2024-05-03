part of 'sign_in_bloc_bloc.dart';

sealed class SignInBlocState extends Equatable {
  const SignInBlocState();

  @override
  List<Object> get props => [];
}

final class SignInBlocInitial extends SignInBlocState {}

class SignInLoadingState extends SignInBlocState {}

class SignInCompletedState extends SignInBlocState {
  final String token;

  const SignInCompletedState({required this.token});
}

class SignInErrorState extends SignInBlocState {
  final DioException error;

  const SignInErrorState({required this.error});
}
