part of 'add_customer_bloc_bloc.dart';

sealed class AddCustomerBlocState extends Equatable {
  final CustomerStoreAddressList? addressList;
  const AddCustomerBlocState({this.addressList});

  @override
  List<Object> get props => [];
}

final class AddCustomerBlocInitial extends AddCustomerBlocState {}

class AddCustomerLoadingState extends AddCustomerBlocState {}

class AddCustomerCompletedState extends AddCustomerBlocState {
  final CustomerStoreAddressList addressList;

  const AddCustomerCompletedState({required this.addressList})
      : super(addressList: addressList);
}

class AddCustomerErrorState extends AddCustomerBlocState {
  final DioException error;

  const AddCustomerErrorState({required this.error});
}
