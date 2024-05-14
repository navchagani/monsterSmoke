import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/domain/usecases/CaseCustomers.dart';

part 'update_customer_bloc_event.dart';
part 'update_customer_bloc_state.dart';

class UpdateCustomerBlocBloc
    extends Bloc<UpdateCustomerBlocEvent, UpdateCustomerBlocState> {
  final CaseUpdateCustomerData customerData;
  UpdateCustomerBlocBloc(this.customerData)
      : super(UpdateCustomerBlocInitial()) {
    on<UpdateCustomerInitialEvent>(customerInitial);
    on<UpdateCustomerEvent>(udpateCustomer);
  }
  Future<FutureOr<void>> udpateCustomer(
      UpdateCustomerEvent event, Emitter<UpdateCustomerBlocState> emit) async {
    emit(UpdateCustomerLoadingState());
    final data = await customerData.call(customerModel: event.customerModel);

    if (data is SuccessState) {
      emit(UpdateCustomerCompletedState(customerModel: data.data!));
    }

    if (data is ErrorState) {
      emit(UpdateCustomerErrorState(error: data.error!));
    }
  }

  FutureOr<void> customerInitial(
      UpdateCustomerInitialEvent event, Emitter<UpdateCustomerBlocState> emit) {
    emit(UpdateCustomerBlocInitial());
  }
}
