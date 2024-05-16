import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:retrofit/retrofit.dart';

part 'PlaceOrderApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class PlaceOrderApi {
  factory PlaceOrderApi(Dio dio) = _PlaceOrderApi;

  @POST('/api/ecommerce/order?storeId=2')
  Future<HttpResponse<PlaceOrderResModel>> placeOrder(
      {@Body() required PlaceOrderModel placeOrderModel,
      @Header('token') required String token,
      @Header('storeId') required String storeId});

  @GET('/api/ecommerce/dashboard/orderTable?page=0&size=20')
  Future<HttpResponse<List<CustomerOrderModel>>> getCustomerOrder(
      {@Header('token') required String token,
      @Header('token') required int page,
      @Header('token') required int size});

  @GET(
      '/services/pdf/sales-order/invoice/17867?token=token&defaultStoreId=2&storeIdList=1,2&isEcommerce=true')
  Future<HttpResponse<String?>> getOrderDetails(
      {@Header('token') @Header('Authorization') required String token,
      @Header('defaultStoreId') required String defaultStoreId,
      @Header('storeIdList') required String storeIdList,
      @Header('isEcommerce') required bool isEcommerce,
      required int orderNumber});
}
