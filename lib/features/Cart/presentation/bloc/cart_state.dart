part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  final UpdateCartModel? updateCartModel;
  const CartState({this.updateCartModel});

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadedState extends CartState {
  @override
  final UpdateCartModel? updateCartModel;
  const CartLoadedState({this.updateCartModel})
      : super(updateCartModel: updateCartModel);
}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final DioException error;

  const CartErrorState({required this.error});
}
