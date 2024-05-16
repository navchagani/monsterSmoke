part of 'placeorder_bloc.dart';

abstract class PlaceorderState extends Equatable {
  final PlaceOrderResModel? placeOrderResModel;
  final List<CustomerOrderModel>? listCustomerModel;
  const PlaceorderState({
    this.placeOrderResModel,
    this.listCustomerModel,
  });

  @override
  List<Object> get props => [];
}

class PlaceorderInitial extends PlaceorderState {}

class PlaceOrderLoadingState extends PlaceorderState {}

class PlaceOrderCompletedState extends PlaceorderState {
  final PlaceOrderResModel placeOrderResModel;

  const PlaceOrderCompletedState({
    required this.placeOrderResModel,
  }) : super(placeOrderResModel: placeOrderResModel);
}

class CustomerOrderCompletedState extends PlaceorderState {
  final List<CustomerOrderModel> listCustomerModel;

  const CustomerOrderCompletedState({
    required this.listCustomerModel,
  }) : super(listCustomerModel: listCustomerModel);
}

class OrderDetailsCompletedState extends PlaceorderState {
  final String? pdf;
  const OrderDetailsCompletedState(this.pdf) : super();
}

class PlaceOrderErrorState extends PlaceorderState {
  final DioException error;

  const PlaceOrderErrorState({required this.error});
}
