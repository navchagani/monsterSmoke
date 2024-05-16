part of 'placeorder_bloc.dart';

abstract class PlaceorderEvent extends Equatable {
  const PlaceorderEvent();

  @override
  List<Object> get props => [];
}

class CustomerOrderInitialEvent extends PlaceorderEvent {}

class GetCustomerOrderEvent extends PlaceorderEvent {
  final String? token;
  final int? page, size;

  const GetCustomerOrderEvent(
      {required this.token, required this.page, required this.size});
}

class GetCustomerOrderDetailsEvent extends PlaceorderEvent {
  final String? token, defaultStoreId, storeIdList;
  final int? orderNumber;
  final bool? isEcommerce;

  const GetCustomerOrderDetailsEvent(
      {required this.token,
      required this.defaultStoreId,
      required this.storeIdList,
      required this.isEcommerce,
      required this.orderNumber});
}

class PlaceOrderEvent extends PlaceorderEvent {
  final PlaceOrderModel placeOrderModel;
  final String token, storeId;

  const PlaceOrderEvent(
      {required this.placeOrderModel,
      required this.token,
      required this.storeId});
}
