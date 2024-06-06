import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';

class LocalCartBloc extends Bloc<LocalCartEvents, LocalCartState> {
  final List<MasterProductDetails> productList = [];

  LocalCartBloc() : super(LocalCartInitialState()) {
    on<LocalCartAddProductEvent>(onLocalCartAdd);
    on<LocalCartRemoveProductEvent>(onLocalCartRemove);
    on<LocalCartClearProductEvent>(onLocalCartClear);
    on<LocalCartOnincrementEvent>(increment);
    on<LocalCartOndecrementEvent>(decrement);
  }

  onLocalCartAdd(
      LocalCartAddProductEvent event, Emitter<LocalCartState> emitter) async {
    emitter(LocalCartLoadingState());
    if (productList.isEmpty) {
      productList.add(event.product);
    } else {
      final productIdList = productList.map((e) => e.productId).toList();
      final isSame = productIdList.contains(event.product.productId);
      // log('add cart triggered');

      if (!isSame) {
        // log('not found');
        final available = event.product.availableQuantity ?? 0;
        if (available > 0) {
          productList.add(event.product);
        }
      } else {
        // log('found');
        final prod = productList.firstWhere(
            (element) => element.productId == event.product.productId);

        final availableQty = prod.availableQuantity ?? 0;
        final qty = prod.quantity ?? 0;

        if (availableQty > qty) {
          prod.quantity = qty + 1;
          log(prod.availableQuantity.toString());
          log("prdocut quatity${prod.quantity.toString()}");
          // log('${prod.toJson()}');
        }
      }
    }

    emitter(LocalCartLoadedState(productList));
  }

  onLocalCartRemove(LocalCartRemoveProductEvent event,
      Emitter<LocalCartState> emitter) async {
    productList
        .removeWhere((element) => element.productId == event.product.productId);

    emitter(LocalCartLoadedState(productList));
  }

  onLocalCartClear(
      LocalCartClearProductEvent event, Emitter<LocalCartState> emitter) async {
    productList.clear();
    emitter(LocalCartLoadedState([]));
  }

  Future<FutureOr<void>> increment(
      LocalCartOnincrementEvent event, Emitter<LocalCartState> emitter) async {
    final product = productList
        .firstWhere((element) => element.productId == event.product.productId);

    log('quantity ${product.quantity}');
    if (product.availableQuantity! >= product.quantity!) {
      product.quantity = product.quantity ?? 0 + 1;
    }

    emitter(LocalCartLoadedState(productList));
  }

  Future<FutureOr<void>> decrement(
      LocalCartOndecrementEvent event, Emitter<LocalCartState> emitter) async {
    emitter(LocalCartLoadingState());
    final product = productList
        .firstWhere((element) => element.productId == event.product.productId);

    if (int.parse(product.quantity.toString()) > 0) {
      product.quantity = product.quantity! - 1;
    }

    emitter(LocalCartLoadedState(productList));
  }
}

abstract class LocalCartState {
  final List<MasterProductDetails> listProduct;

  LocalCartState({required this.listProduct});
}

class LocalCartInitialState extends LocalCartState {
  LocalCartInitialState() : super(listProduct: []);
}

class LocalCartLoadingState extends LocalCartState {
  @override
  LocalCartLoadingState() : super(listProduct: []);
}

class LocalCartLoadedState extends LocalCartState {
  @override
  final List<MasterProductDetails> listProduct;

  LocalCartLoadedState(this.listProduct) : super(listProduct: listProduct);
}

class LocalCartCustomerLoadedState extends LocalCartState {
  @override
  final List<MasterProductDetails> listProduct;

  LocalCartCustomerLoadedState(this.listProduct)
      : super(listProduct: listProduct);
}

abstract class LocalCartEvents {}

class LocalCartInitialEvent extends LocalCartEvents {}

class LocalCartAddProductEvent extends LocalCartEvents {
  final MasterProductDetails product;

  LocalCartAddProductEvent(this.product);
}

class LocalCartRemoveProductEvent extends LocalCartEvents {
  final MasterProductDetails product;

  LocalCartRemoveProductEvent(this.product);
}

class LocalCartClearProductEvent extends LocalCartEvents {
  LocalCartClearProductEvent();
}

class LocalCartOnincrementEvent extends LocalCartEvents {
  final MasterProductDetails product;
  LocalCartOnincrementEvent(this.product);
}

class LocalCartOndecrementEvent extends LocalCartEvents {
  final MasterProductDetails product;
  LocalCartOndecrementEvent(this.product);
}
