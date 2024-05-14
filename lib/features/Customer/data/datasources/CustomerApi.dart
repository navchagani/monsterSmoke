import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:retrofit/retrofit.dart';

part 'CustomerApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CustomerApi {
  @POST('/api/ecommerce/customer/1863/address')
  Future<HttpResponse<CustomerStoreAddressList>> addCustomerAddress(
      {@Header('Authorization') required String token,
      @Body() required CustomerStoreAddressList addressList});

  @PUT('/api/ecommerce/customer/1795/address')
  Future<HttpResponse<CustomerStoreAddressList>> updateCustomerAddress(
      {@Header('Authorization') required String token,
      @Body() required CustomerStoreAddressList addressList});

  @PUT('/api/ecommerce/customer')
  Future<HttpResponse<CustomerModel>> updateCustomer(
      {@Header('Authorization') required String token,
      @Body() required CustomerModel customerModel});

  @GET('/api/ecommerce/customer')
  Future<HttpResponse<CustomerModel?>> getCustomer(
      {@Header('Authorization') required String token});
}
