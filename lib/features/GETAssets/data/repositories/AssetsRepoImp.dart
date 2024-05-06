import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/datasources/AssetsApi.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/repositories/AssetsRepo.dart';

class AssetsRepoImp extends AssetsRepo {
  final AssetsApi assetsApi;

  AssetsRepoImp({required this.assetsApi});

  @override
  Future<DataStates<List<CountryModel>>> getCountries() async {
    try {
      final data = await assetsApi.getCountries();

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
  Future<DataStates<List<SliderModel>>> getSliders(
      {required String sliderId, required String buisnessId}) async {
    try {
      final data = await assetsApi.getSliders(
          sliderId: sliderId, buisnessId: buisnessId);

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
  Future<DataStates<List<StateModel>>> getStates(
      {required String stateId}) async {
    try {
      final data = await assetsApi.getStates(stateId: stateId);

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
