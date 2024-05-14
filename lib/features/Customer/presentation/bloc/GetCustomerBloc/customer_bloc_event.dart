part of 'customer_bloc_bloc.dart';

sealed class CustomerBlocEvent extends Equatable {
  const CustomerBlocEvent();

  @override
  List<Object> get props => [];
}

class CustomerInitialEvent extends CustomerBlocEvent {}

class GetCustomerEvent extends CustomerBlocEvent {
  final String token;

  const GetCustomerEvent({required this.token});
}
