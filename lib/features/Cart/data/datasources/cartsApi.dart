import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';
import 'package:retrofit/retrofit.dart';

part 'cartsApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CartApi {
  factory CartApi(Dio dio) = _CartApi;

  @POST('/api/cartLineItem')
  Future<HttpResponse<List<CartLineItemDtoList>>> addtoCart(
      {required List<ProductModel> productModel,
      @Query('storeId') required String storeId});
  @GET('/api/cartLineItem/search')
  Future<HttpResponse<UpdateCartModel>> getCart(
      {@Query('storeId') required String storeId});
  @PUT('/api/cartLineItem/updateAll')
  Future<HttpResponse<List<CartLineItemDtoList>>> updateCart(
      {required List<UpdateCartModel> updateCartModel,
      @Query('storeId') required String storeId});
  @DELETE('/api/cartLineItem/clearSelected')
  Future<HttpResponse<bool>> deleteFromCart(
      {required List<UpdateCartModel> updateCartModel,
      @Query('storeId') required String storeId});
}