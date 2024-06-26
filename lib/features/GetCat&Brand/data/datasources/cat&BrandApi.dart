import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:retrofit/retrofit.dart';

part 'cat&BrandApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CatBrandApi {
  factory CatBrandApi(Dio dio) = _CatBrandApi;

  @GET('/api/menu')
  Future<HttpResponse> getCategories(
      {@Query('businessTypeId') required String buissnessTypeId});

  @GET('/api/ecommerce/product/brand')
  Future<HttpResponse> getBrands(
      {@Query('storeIds') required String storeIds,
      @Query('brandIdList') required String brandIdList});
}
