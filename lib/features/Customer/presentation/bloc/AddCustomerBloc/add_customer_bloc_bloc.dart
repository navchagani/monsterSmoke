import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Customer/domain/usecases/CaseCustomers.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

import '../../../../Auth/data/models/CustomerModel.dart';

part 'add_customer_bloc_event.dart';
part 'add_customer_bloc_state.dart';

class AddCustomerAddressBloc
    extends Bloc<AddCustomerBlocEvent, AddCustomerBlocState> {
  final CaseAddCustomerAddress addCustomer;
  AddCustomerAddressBloc(this.addCustomer) : super(AddCustomerBlocInitial()) {
    on<AddCustomerInitialEvent>(customerInitial);
    on<AddCustomerAddressEvent>(addCustomerEvent);
  }

  Future<FutureOr<void>> addCustomerEvent(
      AddCustomerAddressEvent event, Emitter<AddCustomerBlocState> emit) async {
    emit(AddCustomerLoadingState());
    final data = await addCustomer.call(addressList: event.addressList);
    final token = await SharedPrefsApi.instance.getFromShared(key: 'login');

    log(token.toString());

    if (data is SuccessState) {
      emit(AddCustomerCompletedState(
          addressList: data.data!, token: token.toString()));
    }

    if (data is ErrorState) {
      emit(AddCustomerErrorState(error: data.error!));
    }
  }

  FutureOr<void> customerInitial(
      AddCustomerInitialEvent event, Emitter<AddCustomerBlocState> emit) {
    emit(AddCustomerBlocInitial());
  }
}
