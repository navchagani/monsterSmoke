part of 'update_customer_address_bloc_bloc.dart';

sealed class UpdateCustomerAddressBlocState extends Equatable {
  final CustomerStoreAddressList? customerModel;
  const UpdateCustomerAddressBlocState({this.customerModel});

  @override
  List<Object> get props => [];
}

final class UpdateCustomerAddressBlocInitial
    extends UpdateCustomerAddressBlocState {}

class UpdateCustomerAddressLoadingState
    extends UpdateCustomerAddressBlocState {}

class UpdateCustomerAddressCompletedState
    extends UpdateCustomerAddressBlocState {
  final CustomerStoreAddressList customerModel;

  const UpdateCustomerAddressCompletedState({required this.customerModel})
      : super(customerModel: customerModel);
}

class UpdateCustomerAddressErrorState extends UpdateCustomerAddressBlocState {
  final DioException error;

  const UpdateCustomerAddressErrorState({required this.error});
}
