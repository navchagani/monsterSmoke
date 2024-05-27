import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';
import 'package:retrofit/retrofit.dart';

part 'cartsApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CartApi {
  factory CartApi(Dio dio, SharedPrefsApi sharedPrefsApi) = _CartApi;

  @POST('/api/cartLineItem')
  Future<HttpResponse> addtoCart(
      {required List<Content> Content,
      @Query('storeId') required String storeId});
  @GET('/api/cartLineItem/search')
  Future<HttpResponse> getCart({@Query('storeId') required String storeId});
  @PUT('/api/cartLineItem/updateAll')
  Future<HttpResponse> updateCart(
      {required List<CartLineItemDtoList> updateCartModel,
      @Query('storeId') required String storeId});
  @DELETE('/api/cartLineItem/clearSelected')
  Future<HttpResponse> deleteFromCart(
      {required List<CartLineItemDtoList> updateCartModel,
      @Query('storeId') required String storeId});
}
