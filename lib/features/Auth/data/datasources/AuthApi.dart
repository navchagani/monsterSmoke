import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart'
    as customerModel;

import 'package:retrofit/retrofit.dart';

part 'AuthApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthApi {
  factory AuthApi(dio.Dio dio) = _AuthApi;

  @POST('/api/authenticate')
  Future<HttpResponse<String?>> signIn(
      {@Body() required String email, @Body() required String password});
  @POST('/api/ecommerce/customer/withDocuments')
  Future<HttpResponse<customerModel.CustomerModel?>> signUp(
      {@Body() required CreateCustomerModel createCustomerModel});
  @GET('/api/ecommerce/customer')
  Future<HttpResponse<customerModel.CustomerModel?>> getCustomerData(
      {@Header('Authorization') required String token});
}
