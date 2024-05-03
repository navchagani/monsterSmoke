part of 'sign_up_bloc_bloc.dart';

sealed class SignUpBlocEvent extends Equatable {
  const SignUpBlocEvent();

  @override
  List<Object> get props => [];
}

class SignUpInitialEvent extends SignUpBlocEvent {}

class SignUpEvent extends SignUpBlocEvent {
  final CreateCustomerModel customerModel;

  const SignUpEvent({required this.customerModel});
}
