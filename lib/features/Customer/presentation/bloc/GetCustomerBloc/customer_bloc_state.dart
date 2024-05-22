// ignore_for_file: overridden_fields

part of 'customer_bloc_bloc.dart';

sealed class CustomerBlocState extends Equatable {
  final CustomerModel? customerModel;
  const CustomerBlocState({this.customerModel});

  @override
  List<Object> get props => [];
}

final class CustomerBlocInitial extends CustomerBlocState {}

class CustomerLoadingState extends CustomerBlocState {}

class CustomerCompletedState extends CustomerBlocState {
  @override
  final CustomerModel customerModel;

  const CustomerCompletedState({required this.customerModel})
      : super(customerModel: customerModel);
}

class CustomerErrorState extends CustomerBlocState {
  final DioException error;

  const CustomerErrorState({required this.error});
}
