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
  final bool? isCompleted;

  const UpdateCustomerCompletedState({required this.isCompleted});
}

class UpdateCustomerErrorState extends UpdateCustomerBlocState {
  final DioException error;

  const UpdateCustomerErrorState({required this.error});
}
