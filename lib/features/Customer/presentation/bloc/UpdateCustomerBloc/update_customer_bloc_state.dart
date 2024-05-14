part of 'update_customer_bloc_bloc.dart';

sealed class UpdateCustomerBlocState extends Equatable {
  final CustomerModel? customerModel;
  const UpdateCustomerBlocState({this.customerModel});

  @override
  List<Object> get props => [];
}

final class UpdateCustomerBlocInitial extends UpdateCustomerBlocState {}

class UpdateCustomerLoadingState extends UpdateCustomerBlocState {}

class UpdateCustomerCompletedState extends UpdateCustomerBlocState {
  final CustomerModel customerModel;

  const UpdateCustomerCompletedState({required this.customerModel})
      : super(customerModel: customerModel);
}

class UpdateCustomerErrorState extends UpdateCustomerBlocState {
  final DioException error;

  const UpdateCustomerErrorState({required this.error});
}
