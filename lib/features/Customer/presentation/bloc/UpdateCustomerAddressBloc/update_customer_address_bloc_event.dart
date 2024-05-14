part of 'update_customer_address_bloc_bloc.dart';

sealed class UpdateCustomerAddressBlocEvent extends Equatable {
  const UpdateCustomerAddressBlocEvent();

  @override
  List<Object> get props => [];
}

class UpdateCustomerInitialEvent extends UpdateCustomerAddressBlocEvent {}

class UpdateCustomerEvent extends UpdateCustomerAddressBlocEvent {
  final CustomerModel customerModel;

  const UpdateCustomerEvent({required this.customerModel});
}
