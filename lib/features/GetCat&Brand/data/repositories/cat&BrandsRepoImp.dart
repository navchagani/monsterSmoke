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
      final result = await catBrandApi.getBrands(
          storeIds: storeIds, brandIdList: brandIdList);

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> content = result.data!['result'];
        var value = content
            .map((dynamic i) => Content.fromJson(i as Map<String, dynamic>))
            .toList();
        return SuccessState(data: value);
      } else if (result.response.statusCode == HttpStatus.forbidden ||
          result.response.statusCode == HttpStatus.badRequest ||
          result.response.statusCode == HttpStatus.badGateway) {
        final error = result.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: error));
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
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
      final result =
          await catBrandApi.getCategories(buissnessTypeId: buissnessTypeId);

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> value = result.data!['result'];

        var data = value
            .map((dynamic i) =>
                CategoryModel.fromJson(i as Map<String, dynamic>))
            .toList();
        return SuccessState(data: data);
      } else if (result.response.statusCode == HttpStatus.forbidden ||
          result.response.statusCode == HttpStatus.badRequest ||
          result.response.statusCode == HttpStatus.badGateway) {
        final error = result.data['error']['message'];

        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: error));
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: result.response.requestOptions,
                message: 'Cannot Get Customer Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
