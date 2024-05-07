part of 'shipping_bloc_bloc.dart';

sealed class ShippingBlocEvent extends Equatable {
  const ShippingBlocEvent();

  @override
  List<Object> get props => [];
}

class ShippingInitialEvent extends ShippingBlocEvent {}

class GetShippingEvent extends ShippingBlocEvent {
  const GetShippingEvent();
}
