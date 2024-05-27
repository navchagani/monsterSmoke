import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/datasources/ProductApi.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductSearchModel.dart';
import 'package:monstersmoke/features/Products/domain/repositories/ProductsRepo.dart';

import '../models/TagProductModel.dart';

class ProductRepoImp extends ProductsRepo {
  final ProductApi productApi;

  ProductRepoImp({required this.productApi});

  @override
  Future<DataStates<ProductDetailModel>> getProductDetails(
      {required String storeIds, required String productId}) async {
    try {
      final result = await productApi.getProductDetails(
          storeIds: storeIds, productId: productId);

      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.data!['result'];
        final value = ProductDetailModel.fromJson(data);
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
  Future<DataStates<ProductModel>> getProducts(
      {required int? categoryIdList,
      required int? page,
      required int? size,
      required String? sort,
      required String? sortDirection,
      required int? storeIds}) async {
    try {
      final result = await productApi.getProducts(
          categoryIdList: categoryIdList,
          page: page,
          size: size,
          sort: sort,
          sortDirection: sortDirection,
          storeIds: storeIds);

      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.data!['result'];

        var value = ProductModel.fromJson(data as Map<String, dynamic>);
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
  Future<DataStates<ProductSearchModel>> searchProducts(
      {required String searchString}) async {
    try {
      final result =
          await productApi.searchProducts(searchString: searchString);

      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.data!['result'];

        final value = ProductSearchModel.fromJson(data);

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
  Future<DataStates<ProductModel>> getTaggedProducts(
      {required int tagId,
      required int? page,
      required int? size,
      required int? storeId,
      required int? buisnessTypeId}) async {
    try {
      final result = await productApi.getTaggedProducts(
          tagId: tagId,
          page: page,
          size: size,
          storeId: storeId,
          buisnessTypeId: buisnessTypeId);

      if (result.response.statusCode == HttpStatus.ok) {
        final data = result.data!['result'];

        var value = ProductModel.fromJson(data as Map<String, dynamic>);

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
  Future<DataStates<List<TagContent>>> getTags() async {
    try {
      final result = await productApi.getTags();

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map((dynamic i) => TagContent.fromJson(i as Map<String, dynamic>))
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
}
