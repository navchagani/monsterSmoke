import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:retrofit/retrofit.dart';

part 'ProductApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ProductApi {
  factory ProductApi(Dio dio) = _ProductApi;

  @GET('/api/ecommerce/product/category')
  Future<HttpResponse<List<ProductModel>>> getProducts(
      {@Query('categoryIdList') required String categoryIdList,
      @Query('page') required String page,
      @Query('size') required String size,
      @Query('sort') required String sort,
      @Query('sortDirection') required String sortDirection,
      @Query('storeIds') required String storeIds});
  @GET('/api/ecommerce/product/27066')
  Future<HttpResponse<ProductDetailModel>> getProductDetails(
      {@Query('storeIds') required String storeIds, required String productId});
}