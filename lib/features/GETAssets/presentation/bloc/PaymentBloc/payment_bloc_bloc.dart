import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'payment_bloc_event.dart';
part 'payment_bloc_state.dart';

class PaymentBloc extends Bloc<PaymentBlocEvent, PaymentBlocState> {
  final CaseGetPayments getPayments;
  PaymentBloc(this.getPayments) : super(PaymentBlocInitial()) {
    on<PaymentInitialEvent>(initial);
    on<GetPaymentEvent>(getPayment);
  }
  Future<FutureOr<void>> getPayment(
      GetPaymentEvent event, Emitter<PaymentBlocState> emit) async {
    emit(PaymentLoadingPayment());
    final data = await getPayments();

    if (data is SuccessState) {
      emit(PaymentCompletedPayment(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(PaymentErrorPayment(error: data.error!));
    }
  }

  FutureOr<void> initial(
      PaymentInitialEvent event, Emitter<PaymentBlocState> emit) {
    emit(PaymentBlocInitial());
  }
}
