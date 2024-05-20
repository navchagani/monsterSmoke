import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/domain/usecases/CasePlaceOrder.dart';

part 'placeorder_event.dart';
part 'placeorder_state.dart';

class PlaceorderBloc extends Bloc<PlaceorderEvent, PlaceorderState> {
  final CaseGetCustomerOrder getCustomerOrder;
  final CaseOrderDetails caseOrderDetails;
  final CasePlaceOrder casePlaceOrder;

  PlaceorderBloc(
      this.getCustomerOrder, this.caseOrderDetails, this.casePlaceOrder)
      : super(PlaceorderInitial()) {
    on<CustomerOrderInitialEvent>(iniital);
    on<GetCustomerOrderEvent>(customerOrderEvent);
    on<GetCustomerOrderDetailsEvent>(customerOrderDetailsEvent);
    on<PlaceOrderEvent>(placeOrder);
  }

  Future<FutureOr<void>> iniital(
      CustomerOrderInitialEvent event, Emitter<PlaceorderState> emit) async {}

  Future<FutureOr<void>> placeOrder(
      PlaceOrderEvent event, Emitter<PlaceorderState> emit) async {
    emit(PlaceOrderLoadingState());
    final data = await casePlaceOrder(
        placeOrderModel: event.placeOrderModel,
        token: event.token,
        storeId: event.storeId);

    if (data is SuccessState) {
      emit(PlaceOrderCompletedState(placeOrderResModel: data.data!));
    }

    if (data is ErrorState) {
      emit(PlaceOrderErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> customerOrderDetailsEvent(
      GetCustomerOrderDetailsEvent event, Emitter<PlaceorderState> emit) async {
    emit(PlaceOrderLoadingState());
    final data = await caseOrderDetails(
      defaultStoreId: event.defaultStoreId,
      storeIdList: event.storeIdList,
      isEcommerce: event.isEcommerce,
      orderNumber: event.orderNumber,
      token: event.token,
    );

    if (data is SuccessState) {
      emit(OrderDetailsCompletedState(data.data));
    }

    if (data is ErrorState) {
      emit(PlaceOrderErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> customerOrderEvent(
      GetCustomerOrderEvent event, Emitter<PlaceorderState> emit) async {
    emit(PlaceOrderLoadingState());
    final data = await getCustomerOrder(
        page: event.page, token: event.token, size: event.size);

    if (data is SuccessState) {
      emit(CustomerOrderCompletedState(listCustomerModel: data.data!));
    }

    if (data is ErrorState) {
      emit(PlaceOrderErrorState(error: data.error!));
    }
  }
}
