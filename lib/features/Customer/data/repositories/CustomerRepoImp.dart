import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/data/datasources/CustomerApi.dart';
import 'package:monstersmoke/features/Customer/domain/repositories/CustomerRepository.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class CustomerRepoImp extends CustomerRepository {
  final CustomerApi customerApi;
  final SharedPrefsApi sharedPrefsApi;
  CustomerRepoImp(this.customerApi, this.sharedPrefsApi);

  @override
  Future<DataStates<CustomerStoreAddressList>> addCustomerAddress(
      {required CustomerStoreAddressList addressList}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final result = await customerApi.addCustomerAddress(
          token: token.toString(), addressList: addressList);

      if (result.response.statusCode == HttpStatus.created) {
        final data = result.data!['result'];
        final value = CustomerStoreAddressList.fromJson(data);
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
  Future<DataStates<CustomerModel>> getCustomer({required String token}) async {
    try {
      final result = await customerApi.getCustomer(token: token);

      if (result.response.statusCode == HttpStatus.ok) {
        final value = result.data!['result'];
        final customerData = value['customerDto'];
        final model =
            result.data == null ? null : CustomerModel.fromJson(customerData!);
        log('getcustomer data : $model');
        return SuccessState(data: model);
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
  Future<DataStates<bool>> updateCustomer(
      {required CustomerModel customerModel}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');
      log('tokendata $token');
      final data = await customerApi.updateCustomer(
          token: token.toString(), customerModel: customerModel);

      if (data.response.statusCode == HttpStatus.created) {
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
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<CustomerStoreAddressList>> updateCustomerAddress(
      {required CustomerStoreAddressList addressList}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');

      final data = await customerApi.updateCustomerAddress(
          token: token.toString(), addressList: addressList);

      if (data.response.statusCode == HttpStatus.ok) {
        final result = data.data!['result'];
        final value = CustomerStoreAddressList.fromJson(result);
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
                message: 'Error Signing In'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
