part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitialEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final String storeId;
  final List<ProductModel> list;

  const AddToCartEvent({required this.storeId, required this.list});
}

class UpdateCartEvent extends CartEvent {
  final String storeId;
  final List<CartLineItemDtoList> list;

  const UpdateCartEvent({required this.storeId, required this.list});
}

class RemoveFromCartEvent extends CartEvent {
  final String storeId;
  final List<CartLineItemDtoList> list;

  const RemoveFromCartEvent({required this.storeId, required this.list});
}

class GetCartEvent extends CartEvent {
  final String storeId;

  const GetCartEvent({required this.storeId});
}
