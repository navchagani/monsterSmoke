import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Cart/data/datasources/cartsApi.dart';
import 'package:monstersmoke/features/Cart/domain/repositories/CartRepo.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class CartRepoImp extends CartRepo {
  final CartApi cartApi;

  CartRepoImp({required this.cartApi});

  @override
  Future<DataStates<List<CartLineItemDtoList>>> addtoCart(
      {required List<ProductModel> productModel,
      required String storeId}) async {
    try {
      final data =
          await cartApi.addtoCart(productModel: productModel, storeId: storeId);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<bool>> deleteFromCart(
      {required List<CartLineItemDtoList> updateCartModel,
      required String storeId}) async {
    try {
      final data = await cartApi.deleteFromCart(
          updateCartModel: updateCartModel, storeId: storeId);

      if (data.response.statusCode == HttpStatus.noContent) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<UpdateCartModel>> getCart({required String storeId}) async {
    try {
      final data = await cartApi.getCart(storeId: storeId);

      if (data.response.statusCode == HttpStatus.ok) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<List<CartLineItemDtoList>>> updateCart(
      {required List<CartLineItemDtoList> updateCartModel,
      required String storeId}) async {
    try {
      final data = await cartApi.updateCart(
          updateCartModel: updateCartModel, storeId: storeId);

      if (data.response.statusCode == HttpStatus.ok) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
