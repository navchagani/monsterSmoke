part of 'payment_bloc_bloc.dart';

sealed class PaymentBlocEvent extends Equatable {
  const PaymentBlocEvent();

  @override
  List<Object> get props => [];
}

class PaymentInitialEvent extends PaymentBlocEvent {}

class GetPaymentEvent extends PaymentBlocEvent {
  const GetPaymentEvent();
}
