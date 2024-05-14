part of 'add_customer_bloc_bloc.dart';

sealed class AddCustomerBlocState extends Equatable {
  const AddCustomerBlocState();
  
  @override
  List<Object> get props => [];
}

final class AddCustomerBlocInitial extends AddCustomerBlocState {}
