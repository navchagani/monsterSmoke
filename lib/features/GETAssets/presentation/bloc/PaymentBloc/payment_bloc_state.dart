part of 'payment_bloc_bloc.dart';

sealed class PaymentBlocState extends Equatable {
  const PaymentBlocState();

  @override
  List<Object> get props => [];
}

final class PaymentBlocInitial extends PaymentBlocState {}

class PaymentLoadingPayment extends PaymentBlocState {}

class PaymentCompletedPayment extends PaymentBlocState {
  final List<PaymentsModel> lilstContries;

  const PaymentCompletedPayment({required this.lilstContries});
}

class PaymentErrorPayment extends PaymentBlocState {
  final DioException error;

  const PaymentErrorPayment({required this.error});
}
