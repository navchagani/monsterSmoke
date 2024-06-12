import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';

import 'package:retrofit/retrofit.dart';

part 'AuthApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthApi {
  factory AuthApi(dio.Dio dio) = _AuthApi;

  @POST('/api/authenticate')
  Future<HttpResponse> signIn(
      {@Body() required String email, @Body() required String password});
  @POST('/api/ecommerce/customer/withDocuments')
  Future<HttpResponse> signUp(
      {@Body() required CreateCustomerModel createCustomerModel});

  @POST('/api/ecommerce/customer/resetPassword?email=email&token=token')
  Future<HttpResponse> resetPassword(
      {@Query('email') required String? email,
      @Query('token') required String? token});
  @POST('/api/ecommerce/customer/changePassword')
  Future<HttpResponse> changePassword(
      {@Body() required String? oldPassword,
      @Body() required String? password,
      @Body() required String? newPassword,
      @Header('Authorization') String? token});

  @POST('/api/ecommerce/customer/sendForgotPasswordEmail?email=email')
  Future<HttpResponse> forgotPassword({required String? email});
}
