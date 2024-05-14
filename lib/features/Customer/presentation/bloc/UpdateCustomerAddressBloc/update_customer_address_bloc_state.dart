part of 'update_customer_address_bloc_bloc.dart';

sealed class UpdateCustomerAddressBlocState extends Equatable {
  const UpdateCustomerAddressBlocState();
  
  @override
  List<Object> get props => [];
}

final class UpdateCustomerAddressBlocInitial extends UpdateCustomerAddressBlocState {}
