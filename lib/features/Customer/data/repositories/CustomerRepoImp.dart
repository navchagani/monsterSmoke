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

      final data = await customerApi.addCustomerAddress(
          token: token.toString(), addressList: addressList);

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
  Future<DataStates<CustomerModel>> getCustomer({required String token}) async {
    try {
      final data = await customerApi.getCustomer(token: token);

      if (data.response.statusCode == HttpStatus.ok) {
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
  Future<DataStates<bool>> updateCustomer(
      {required CustomerModel customerModel}) async {
    try {
      final token = await sharedPrefsApi.getFromShared(key: 'login');
      log('tokendata $token');
      final data = await customerApi.updateCustomer(
          token: token.toString(), customerModel: customerModel);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: true);
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
