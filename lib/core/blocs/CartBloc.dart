import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class CartBloc extends Bloc<CartEvents?, CartState> {
  final List<ProductModel> productList = [];

  CartBloc() : super(CartInitialState()) {
    on<CartAddProductModelEvent>(onCartAdd);
    on<CartRemoveProductModelEvent>(onCartRemove);
    on<CartClearProductModelEvent>(onCartClear);
    on<CartOnincrementEvent>(increment);
    on<CartOndecrementEvent>(decrement);
  }

  onCartAdd(CartAddProductModelEvent event, Emitter<CartState> emitter) async {
    // final skuList = productList.map((e) => e.productId).toList();
    // final isSame = skuList.contains(event.ProductModel.productId);

    // if (!isSame) {
    //   productList.add(event.ProductModel);
    // } else {
    //   final prod = productList.firstWhere(
    //       (element) => element.productId == event.ProductModel.productId);
    //   prod.quantity = (int.parse(prod.quantity.toString()) + 1).toString();
    // }

    emitter(CartLoadedState(productList));
  }

  onCartRemove(
      CartRemoveProductModelEvent event, Emitter<CartState> emitter) async {
    // productList.removeWhere(
    //     (element) => element.variationId == event.ProductModel.variationId);

    emitter(CartLoadedState(productList));
  }

  onCartClear(
      CartClearProductModelEvent event, Emitter<CartState> emitter) async {
    productList.clear();

    emitter(CartLoadedState([]));
  }

  Future<FutureOr<void>> increment(
      CartOnincrementEvent event, Emitter<CartState> emitter) async {
    // final ProductModel = productList.firstWhere(
    //     (element) => element.variationId == event.ProductModel.variationId);

    // ProductModel.quantity =
    //     (int.parse(ProductModel.quantity.toString()) + 1).toString();

    // emitter(CartLoadedState(productList));
  }

  Future<FutureOr<void>> decrement(
      CartOndecrementEvent event, Emitter<CartState> emitter) async {
    // final ProductModel = productList
    //     .firstWhere((element) => element.variationId == event.model.productId);

    // if (int.parse(ProductModel.quantity.toString()) > 1) {
    //   ProductModel.quantity =
    //       (int.parse(ProductModel.quantity.toString()) - 1).toString();
    // }

    // emitter(CartLoadedState(productList));
  }
}

abstract class CartState {
  final List<ProductModel> listProductModel;

  CartState(this.listProductModel);
}

class CartInitialState extends CartState {
  CartInitialState() : super([]);
}

class CartLoadedState extends CartState {
  @override
  final List<ProductModel> listProductModel;

  CartLoadedState(this.listProductModel) : super(listProductModel);
}

class CartCustomerLoadedState extends CartState {
  @override
  final List<ProductModel> listProductModel;

  CartCustomerLoadedState(this.listProductModel) : super(listProductModel);
}

abstract class CartEvents {}

class CartInitialEvent extends CartEvents {}

class CartAddProductModelEvent extends CartEvents {
  final ProductModel model;

  CartAddProductModelEvent(this.model);
}

class CartRemoveProductModelEvent extends CartEvents {
  final ProductModel model;

  CartRemoveProductModelEvent(this.model);
}

class CartClearProductModelEvent extends CartEvents {
  CartClearProductModelEvent();
}

class CartOnincrementEvent extends CartEvents {
  final ProductModel model;
  CartOnincrementEvent(this.model);
}

class CartOndecrementEvent extends CartEvents {
  final ProductModel model;
  CartOndecrementEvent(this.model);
}
