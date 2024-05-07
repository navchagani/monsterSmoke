import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/usecases/AssetsUseCase.dart';

part 'shipping_bloc_event.dart';
part 'shipping_bloc_state.dart';

class ShippingBloc extends Bloc<ShippingBlocEvent, ShippingBlocState> {
  final CaseGetShippingAddresses shippingAddresses;
  ShippingBloc(this.shippingAddresses) : super(ShippingBlocInitial()) {
    on<ShippingInitialEvent>(initial);
    on<GetShippingEvent>(getShipping);
  }

  Future<FutureOr<void>> getShipping(
      GetShippingEvent event, Emitter<ShippingBlocState> emit) async {
    emit(ShippingLoadingShipping());
    final data = await shippingAddresses();

    if (data is SuccessState) {
      emit(ShippingCompletedShipping(lilstContries: data.data!));
    }

    if (data is ErrorState) {
      emit(ShippingErrorShipping(error: data.error!));
    }
  }

  FutureOr<void> initial(
      ShippingInitialEvent event, Emitter<ShippingBlocState> emit) {
    emit(ShippingBlocInitial());
  }
}
