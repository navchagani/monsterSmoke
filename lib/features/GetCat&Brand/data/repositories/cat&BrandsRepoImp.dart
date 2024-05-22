import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/datasources/cat&BrandApi.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/repositories/cat&BrandRepo.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class CatBrandsRepoImp extends CatBrandRepo {
  final CatBrandApi catBrandApi;
  CatBrandsRepoImp(this.catBrandApi);

  @override
  Future<DataStates<List<Content>>> getBrands(
      {required String storeIds, required String brandIdList}) async {
    try {
      final data = await catBrandApi.getBrands(
          storeIds: storeIds, brandIdList: brandIdList);

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
  Future<DataStates<List<CategoryModel>>> getCategories(
      {required String buissnessTypeId}) async {
    try {
      final data =
          await catBrandApi.getCategories(buissnessTypeId: buissnessTypeId);

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
