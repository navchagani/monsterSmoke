import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Customer/domain/usecases/CaseCustomers.dart';

import '../../../../Auth/data/models/CustomerModel.dart';

part 'update_customer_address_bloc_event.dart';
part 'update_customer_address_bloc_state.dart';

class UpdateCustomerAddressBlocBloc extends Bloc<UpdateCustomerAddressBlocEvent,
    UpdateCustomerAddressBlocState> {
  final CaseUpdateCustomerAddress caseUpdateCustomerAddress;
  UpdateCustomerAddressBlocBloc(this.caseUpdateCustomerAddress)
      : super(UpdateCustomerAddressBlocInitial()) {
    on<UpdateCustomerAddressInitialEvent>(customerAddressInitial);
    on<UpdateCustomerAddressEvent>(udpateCustomerAddress);
  }

  Future<FutureOr<void>> udpateCustomerAddress(UpdateCustomerAddressEvent event,
      Emitter<UpdateCustomerAddressBlocState> emit) async {
    emit(UpdateCustomerAddressLoadingState());
    final data =
        await caseUpdateCustomerAddress.call(addressList: event.addressList);

    if (data is SuccessState) {
      emit(UpdateCustomerAddressCompletedState(customerModel: data.data!));
    }

    if (data is ErrorState) {
      emit(UpdateCustomerAddressErrorState(error: data.error!));
    }
  }

  FutureOr<void> customerAddressInitial(UpdateCustomerAddressInitialEvent event,
      Emitter<UpdateCustomerAddressBlocState> emit) {
    emit(UpdateCustomerAddressBlocInitial());
  }
}
