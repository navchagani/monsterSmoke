part of 'update_customer_address_bloc_bloc.dart';

sealed class UpdateCustomerAddressBlocEvent extends Equatable {
  const UpdateCustomerAddressBlocEvent();

  @override
  List<Object> get props => [];
}

class UpdateCustomerAddressInitialEvent
    extends UpdateCustomerAddressBlocEvent {}

class UpdateCustomerAddressEvent extends UpdateCustomerAddressBlocEvent {
  final CustomerStoreAddressList addressList;

  const UpdateCustomerAddressEvent({required this.addressList});
}
