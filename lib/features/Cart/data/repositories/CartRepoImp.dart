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
      {required List<Content> Content, required String storeId}) async {
    try {
      final result =
          await cartApi.addtoCart(Content: Content, storeId: storeId);

      if (result.response.statusCode == HttpStatus.created) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map((dynamic i) =>
                CartLineItemDtoList.fromJson(i as Map<String, dynamic>))
            .toList();
        return SuccessState(data: value);
      } else if (result.response.statusCode == HttpStatus.forbidden ||
          result.response.statusCode == HttpStatus.badRequest ||
          result.response.statusCode == HttpStatus.badGateway) {
        final error = result.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: error));
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
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
        return SuccessState(data: true);
      } else if (data.response.statusCode == HttpStatus.forbidden ||
          data.response.statusCode == HttpStatus.badRequest ||
          data.response.statusCode == HttpStatus.badGateway) {
        final error = data.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions, message: error));
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
        final value = UpdateCartModel.fromJson(data.data!['result']);
        return SuccessState(data: value);
      } else if (data.response.statusCode == HttpStatus.forbidden ||
          data.response.statusCode == HttpStatus.badRequest ||
          data.response.statusCode == HttpStatus.badGateway) {
        final error = data.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions, message: error));
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
      final result = await cartApi.updateCart(
          updateCartModel: updateCartModel, storeId: storeId);

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];

        var value = data
            .map((dynamic i) =>
                CartLineItemDtoList.fromJson(i as Map<String, dynamic>))
            .toList();
        return SuccessState(data: value);
      } else if (result.response.statusCode == HttpStatus.forbidden ||
          result.response.statusCode == HttpStatus.badRequest ||
          result.response.statusCode == HttpStatus.badGateway) {
        final error = result.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: error));
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
