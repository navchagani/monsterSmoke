import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/domain/usecases/AuthCases.dart';

part 'customer_bloc_event.dart';
part 'customer_bloc_state.dart';

class CustomerBloc extends Bloc<CustomerBlocEvent, CustomerBlocState> {
  final CaseGetUserData caseGetUserData;
  CustomerBloc(this.caseGetUserData) : super(CustomerBlocInitial()) {
    on<CustomerInitialEvent>(customerInitial);
    on<GetCustomerEvent>(getCustomer);
  }

  Future<FutureOr<void>> getCustomer(
      GetCustomerEvent event, Emitter<CustomerBlocState> emit) async {
    emit(CustomerLoadingState());
    final data = await caseGetUserData.call(token: event.token);

    if (data is SuccessState) {
      emit(CustomerCompletedState(customerModel: data.data!));
    }

    if (data is ErrorState) {
      emit(CustomerErrorState(error: data.error!));
    }
  }

  FutureOr<void> customerInitial(
      CustomerInitialEvent event, Emitter<CustomerBlocState> emit) {
    emit(CustomerBlocInitial());
  }
}
