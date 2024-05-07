part of 'shipping_bloc_bloc.dart';

sealed class ShippingBlocState extends Equatable {
  const ShippingBlocState();

  @override
  List<Object> get props => [];
}

final class ShippingBlocInitial extends ShippingBlocState {}

class ShippingLoadingShipping extends ShippingBlocState {}

class ShippingCompletedShipping extends ShippingBlocState {
  final List<ShippingAddressModel> lilstContries;

  const ShippingCompletedShipping({required this.lilstContries});
}

class ShippingErrorShipping extends ShippingBlocState {
  final DioException error;

  const ShippingErrorShipping({required this.error});
}
