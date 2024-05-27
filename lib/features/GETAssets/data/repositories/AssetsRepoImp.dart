import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/datasources/AssetsApi.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/htmlModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/repositories/AssetsRepo.dart';

class AssetsRepoImp extends AssetsRepo {
  final AssetsApi assetsApi;

  AssetsRepoImp({required this.assetsApi});

  @override
  Future<DataStates<List<CountryModel>>> getCountries() async {
    try {
      final result = await assetsApi.getCountries();

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map(
                (dynamic i) => CountryModel.fromJson(i as Map<String, dynamic>))
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
  Future<DataStates<List<SliderModel>>> getSliders(
      {required String sliderId, required String buisnessId}) async {
    try {
      final result = await assetsApi.getSliders(
          sliderId: sliderId, buisnessId: buisnessId);

      if (result.response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> data = result.data!['result'];
        List<dynamic> slides = data['sliderImageList'];
        var value = slides
            .map((dynamic i) => SliderModel.fromJson(i as Map<String, dynamic>))
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
  Future<DataStates<List<StateModel>>> getStates(
      {required String stateId}) async {
    try {
      final result = await assetsApi.getStates(stateId: stateId);

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map((dynamic i) => StateModel.fromJson(i as Map<String, dynamic>))
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
  Future<DataStates<List<PaymentsModel>>> getPaymentMethods() async {
    try {
      final result = await assetsApi.getPaymentMethods();

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map((dynamic i) =>
                PaymentsModel.fromJson(i as Map<String, dynamic>))
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
  Future<DataStates<List<ShippingAddressModel>>> getShippingAddress() async {
    try {
      final result = await assetsApi.getShippingAddress();

      if (result.response.statusCode == HttpStatus.ok) {
        List<dynamic> data = result.data!['result'];
        var value = data
            .map((dynamic i) =>
                ShippingAddressModel.fromJson(i as Map<String, dynamic>))
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
  Future<DataStates<HtmlModel>> getPage({required String alias}) async {
    try {
      final result = await assetsApi.getPage(alias: alias);

      if (result.response.statusCode == HttpStatus.ok) {
        Map<String, dynamic> data = result.data!['result'];
        var value = HtmlModel.fromJson(data);
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
