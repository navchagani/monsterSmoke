part of 'update_customer_bloc_bloc.dart';

sealed class UpdateCustomerBlocEvent extends Equatable {
  const UpdateCustomerBlocEvent();

  @override
  List<Object> get props => [];
}

class UpdateCustomerInitialEvent extends UpdateCustomerBlocEvent {}

class UpdateCustomerEvent extends UpdateCustomerBlocEvent {
  final CustomerModel customerModel;

  const UpdateCustomerEvent({required this.customerModel});
}
