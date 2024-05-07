part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadedState extends CartState {
  final UpdateCartModel updateCartModel;

  const CartLoadedState({required this.updateCartModel});
}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final DioException error;

  const CartErrorState({required this.error});
}
