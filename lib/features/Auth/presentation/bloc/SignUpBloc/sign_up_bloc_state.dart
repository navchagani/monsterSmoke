part of 'sign_up_bloc_bloc.dart';

sealed class SignUpBlocState extends Equatable {
  const SignUpBlocState();

  @override
  List<Object> get props => [];
}

final class SignUpBlocInitial extends SignUpBlocState {}

class SignUpLoadingState extends SignUpBlocState {}

class SignUpCompletedState extends SignUpBlocState {
  final bool completed;

  const SignUpCompletedState({required this.completed});
}

class SignUpErrorState extends SignUpBlocState {
  final DioException error;

  const SignUpErrorState({required this.error});
}
