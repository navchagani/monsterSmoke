part of 'add_customer_bloc_bloc.dart';

sealed class AddCustomerBlocEvent extends Equatable {
  const AddCustomerBlocEvent();

  @override
  List<Object> get props => [];
}

class AddCustomerInitialEvent extends AddCustomerBlocEvent {}

class AddCustomerAddressEvent extends AddCustomerBlocEvent {
  final CustomerStoreAddressList addressList;

  const AddCustomerAddressEvent({required this.addressList});
}
