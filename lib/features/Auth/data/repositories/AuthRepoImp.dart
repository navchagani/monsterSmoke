import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/datasources/AuthApi.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/domain/repositories/AuthRepo.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class AuthRepoImp extends AuthRepo {
  final AuthApi authApi;
  final SharedPrefsApi sharedPrefsApi;

  AuthRepoImp({
    required this.authApi,
    required this.sharedPrefsApi,
  });

  @override
  Future<DataStates<String?>> signIn(
      {required String email, required String password}) async {
    try {
      final data = await authApi.signIn(email: email, password: password);

      if (data.response.statusCode == HttpStatus.ok) {
        await sharedPrefsApi.saveToShared(
            value: data.data.toString(), key: 'login');
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

  @override
  Future<DataStates<void>> changePassword(
      {required String? oldPassword,
      required String? password,
      required String? newPassword}) async {
    try {
      final data = await authApi.changePassword(
          oldPassword: oldPassword,
          password: password,
          newPassword: newPassword);

      if (data.response.statusCode == HttpStatus.noContent) {
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
    ;
  }

  @override
  Future<DataStates<void>> resetPassword(
      {required String? email, required String? token}) {
    throw UnimplementedError();
    //  try {
    //     final data =
    //         await authApi.signUp(createCustomerModel: createCustomerModel);

    //     if (data.response.statusCode == HttpStatus.created) {
    //       return SuccessState(data: data.data);
    //     } else {
    //       return ErrorState(
    //           dioException: DioException(
    //               requestOptions: data.response.requestOptions,
    //               message: 'Error Signing Up'));
    //     }
    //   } on DioException catch (e) {
    //     return ErrorState(dioException: e);
    //   };
  }
}
