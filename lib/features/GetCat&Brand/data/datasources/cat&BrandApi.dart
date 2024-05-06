import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/BrandModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:retrofit/retrofit.dart';

part 'cat&BrandApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class CatBrandApi {
  @GET('/api/menu')
  Future<HttpResponse<List<CategoryModel>>> getCategories(
      {@Query('businessTypeId') required String buissnessTypeId});

  @GET('/api/ecommerce/product/brand')
  Future<HttpResponse<List<BrandModel>>> getBrands(
      {@Query('storeIds') required String storeIds,
      @Query('brandIdList') required String brandIdList});
}
