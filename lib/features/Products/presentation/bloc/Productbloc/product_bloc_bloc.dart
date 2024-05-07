import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/domain/usecases/UseCaseProducts.dart';

part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  final CaseGetProducts getProducts;
  final CaseGetProductDetails getProductDetails;
  ProductBloc(this.getProducts, this.getProductDetails)
      : super(ProductBlocInitial()) {
    on<ProductInitialEvent>(initial);
    on<GetProductEvent>(getProductsFunc);
    on<GetProductDetailEvent>(getProductsDetailFunc);
  }

  Future<FutureOr<void>> getProductsFunc(
      GetProductEvent event, Emitter<ProductBlocState> emit) async {
    emit(ProductLoadingState());
    final data = await getProducts(
        categoryIdList: event.categoryIdList,
        size: event.size,
        page: event.page,
        sort: event.sort,
        sortDirection: event.sortDirection,
        storeIds: event.storeIds);

    if (data is SuccessState) {
      emit(ProductCompletedState(listProducts: data.data!));
    }

    if (data is ErrorState) {
      emit(ProductErrorState(error: data.error!));
    }
  }

  Future<FutureOr<void>> getProductsDetailFunc(
      GetProductDetailEvent event, Emitter<ProductBlocState> emit) async {
    emit(ProductLoadingState());
    final data = await getProductDetails(
        productId: event.productId, storeIds: event.storeIds);

    if (data is SuccessState) {
      emit(ProductDetailCompletedState(productDetailModel: data.data!));
    }

    if (data is ErrorState) {
      emit(ProductErrorState(error: data.error!));
    }
  }

  FutureOr<void> initial(
      ProductInitialEvent event, Emitter<ProductBlocState> emit) {
    emit(ProductBlocInitial());
  }
}
