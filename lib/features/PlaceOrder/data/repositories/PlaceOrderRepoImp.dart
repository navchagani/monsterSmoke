import 'dart:io';

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
      {required String token, required int page, required int size}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final data = await placeOrderApi.getCustomerOrder(
          token: token.toString(), page: page, size: size);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<void>> getOrderDetails(
      {required String token,
      required String defaultStoreId,
      required String storeIdList,
      required String isEcommerce,
      required int orderNumber}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final data = await placeOrderApi.getOrderDetails(
          token: token.toString(),
          defaultStoreId: defaultStoreId,
          storeIdList: storeIdList,
          isEcommerce: isEcommerce,
          orderNumber: orderNumber);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
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

      final data = await placeOrderApi.placeOrder(
          placeOrderModel: placeOrderModel,
          token: token.toString(),
          storeId: storeId);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
