import 'dart:io';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/PlaceOrder/data/datasources/PlaceOrderApi.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/domain/repositories/PlaceOrderRepo.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class PlaceOrderRepoImp extends PlaceOrderRepo {
  final PlaceOrderApi placeOrderApi;
  final SharedPrefsApi sharedPrefsApi;
  PlaceOrderRepoImp(
      {required this.placeOrderApi, required this.sharedPrefsApi});

  @override
  Future<DataStates<List<CustomerOrderModel>>> getCustomerOrder(
      {required int page, required int size}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final result = await placeOrderApi.getCustomerOrder(
          token: token.toString(), page: page, size: size);

      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.data!['result'];
        List<dynamic> content = data!['content'];

        var value = content
            .map((dynamic i) =>
                CustomerOrderModel.fromJson(i as Map<String, dynamic>))
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
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<String?>> getOrderDetails(
      {required String token,
      required String defaultStoreId,
      required String storeIdList,
      required bool isEcommerce,
      required int orderNumber}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final result = await placeOrderApi.getOrderDetails(
          token: token.toString(),
          defaultStoreId: defaultStoreId,
          storeIdList: storeIdList,
          isEcommerce: isEcommerce,
          orderNumber: orderNumber);

      if (result.response.statusCode == HttpStatus.ok) {
        log('${result.data}');
        return SuccessState(data: result.data);
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
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<PlaceOrderResModel>> placeOrder(
      {required PlaceOrderModel placeOrderModel,
      required String token,
      required String storeId}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final result = await placeOrderApi.placeOrder(
          placeOrderModel: placeOrderModel,
          token: token.toString(),
          storeId: storeId);

      if (result.response.statusCode == HttpStatus.created) {
        final data = result.data!['result'];

        final value = PlaceOrderResModel.fromJson(data);
        // log('${data.data.toJson()}');
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
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
