import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Cart/domain/usecases/CartUseCase.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CaseAddToCart caseAddToCart;
  final CaseGetCart caseGetCart;
  final CaseRemoveFromCart caseRemoveFromCart;
  final CaseUpdateToCart caseUpdateToCart;

  CartBloc(this.caseAddToCart, this.caseGetCart, this.caseRemoveFromCart,
      this.caseUpdateToCart)
      : super(CartInitial()) {
    on<CartInitialEvent>(initial);
    on<AddToCartEvent>(addToCart);
    on<UpdateCartEvent>(updateCart);
    on<RemoveFromCartEvent>(removeFromCart);
    on<GetCartEvent>(getCart);
  }

  Future<FutureOr<void>> updateCart(
      UpdateCartEvent event, Emitter<CartState> emit) async {
    final data = await caseUpdateToCart(
        storeId: event.storeId, cartLineItemDtoList: event.list);

    if (data is SuccessState) {
      add(GetCartEvent(storeId: event.storeId));
    }

    if (data is ErrorState) {
      emit(CartErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> addToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    final data =
        await caseAddToCart(Content: event.list, storeId: event.storeId);

    if (data is SuccessState) {
      add(GetCartEvent(storeId: event.storeId));
    }

    if (data is ErrorState) {
      emit(CartErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> removeFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    final data = await caseRemoveFromCart(
        storeId: event.storeId, updateCartModel: event.list);

    if (data is SuccessState) {
      add(GetCartEvent(storeId: event.storeId));
    }

    if (data is ErrorState) {
      emit(CartErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> getCart(
      GetCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    final data = await caseGetCart(storeId: event.storeId);

    if (data is SuccessState) {
      // log('${data.data}');
      emit(CartLoadedState(updateCartModel: data.data!));
    }

    if (data is ErrorState) {
      emit(CartErrorState(error: data.error!));
    }
  }

  FutureOr<void> initial(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartInitial());
  }
}
