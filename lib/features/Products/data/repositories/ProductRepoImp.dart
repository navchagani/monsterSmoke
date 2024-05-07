import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/datasources/ProductApi.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/domain/repositories/ProductsRepo.dart';

class ProductRepoImp extends ProductsRepo {
  final ProductApi productApi;

  ProductRepoImp({required this.productApi});

  @override
  Future<DataStates<ProductDetailModel>> getProductDetails(
      {required String storeIds, required String productId}) async {
    try {
      final data = await productApi.getProductDetails(
          storeIds: storeIds, productId: productId);

      if (data.response.statusCode == HttpStatus.ok) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }

  @override
  Future<DataStates<List<ProductModel>>> getProducts(
      {required int? categoryIdList,
      required int? page,
      required int? size,
      required String? sort,
      required String? sortDirection,
      required int? storeIds}) async {
    try {
      final data = await productApi.getProducts(
          categoryIdList: categoryIdList,
          page: page,
          size: size,
          sort: sort,
          sortDirection: sortDirection,
          storeIds: storeIds);

      if (data.response.statusCode == HttpStatus.ok) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
