import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:retrofit/retrofit.dart';

part 'AuthApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AuthApi {
  factory AuthApi(dio.Dio dio) = _AuthApi;

  @POST('/api/authenticate')
  Future<HttpResponse<String?>> signIn(
      {@Body() required String email, @Body() required String password});
  @POST('/api/ecommerce/customer/withDocuments')
  Future<HttpResponse<bool?>> signUp(
      {@Body() required CreateCustomerModel customerModel});
  @GET('/api/ecommerce/customer')
  Future<HttpResponse<CustomerModel?>> getCustomerData(
      {@Header('Authorization') required String token});
}
