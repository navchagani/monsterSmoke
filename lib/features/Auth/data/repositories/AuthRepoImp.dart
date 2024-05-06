import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/datasources/AuthApi.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/domain/repositories/AuthRepo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthApi authApi;

  AuthRepoImp({required this.authApi});

  @override
  Future<DataStates<CustomerModel?>> getCustomerData(
      {required String token}) async {
    try {
      final data = await authApi.getCustomerData(token: token);

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
  Future<DataStates<String?>> signIn(
      {required String email, required String password}) async {
    try {
      final data = await authApi.signIn(email: email, password: password);

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
  Future<DataStates<CustomerModel?>> signUp(
      {required CreateCustomerModel createCustomerModel}) async {
    try {
      final data =
          await authApi.signUp(createCustomerModel: createCustomerModel);

      if (data.response.statusCode == HttpStatus.created) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Error Signing Up'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
