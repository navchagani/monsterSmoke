import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/TagProductModel.dart';
import 'package:retrofit/retrofit.dart';

part 'ProductApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ProductApi {
  factory ProductApi(Dio dio) = _ProductApi;

  @GET('/api/ecommerce/product/category')
  Future<HttpResponse> getProducts(
      {@Query('categoryIdList') required int? categoryIdList,
      @Query('page') required int? page,
      @Query('size') required int? size,
      @Query('sort') required String? sort,
      @Query('sortDirection') required String? sortDirection,
      @Query('storeIds') required int? storeIds});
  @GET('/api/ecommerce/product/27066')
  Future<HttpResponse> getProductDetails(
      {@Query('storeIds') required String storeIds, required String productId});
  @GET('/api/ecommerce/product/searchByProductOrCategory')
  Future<HttpResponse> searchProducts(
      {@Query('searchInput') required String searchString});

  @GET('/api/home/productTagList')
  Future<HttpResponse> getTags();
  @GET('/api/home/product/tagId/2')
  Future<HttpResponse> getTaggedProducts(
      {required int tagId,
      required int? page,
      required int? size,
      required int? storeId,
      required int? buisnessTypeId});
}
