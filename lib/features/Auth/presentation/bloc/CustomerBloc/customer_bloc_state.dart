part of 'customer_bloc_bloc.dart';

sealed class CustomerBlocState extends Equatable {
  const CustomerBlocState();

  @override
  List<Object> get props => [];
}

final class CustomerBlocInitial extends CustomerBlocState {}

class CustomerLoadingState extends CustomerBlocState {}

class CustomerCompletedState extends CustomerBlocState {
  final CustomerModel customerModel;

  const CustomerCompletedState({required this.customerModel});
}

class CustomerErrorState extends CustomerBlocState {
  final DioException error;

  const CustomerErrorState({required this.error});
}
