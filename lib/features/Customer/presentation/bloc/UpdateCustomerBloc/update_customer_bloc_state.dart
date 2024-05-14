part of 'update_customer_bloc_bloc.dart';

sealed class UpdateCustomerBlocState extends Equatable {
  const UpdateCustomerBlocState();
  
  @override
  List<Object> get props => [];
}

final class UpdateCustomerBlocInitial extends UpdateCustomerBlocState {}
