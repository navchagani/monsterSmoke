import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Dashboard/data/datasources/dashboardApi.dart';
import 'package:monstersmoke/features/Dashboard/data/models/dashboardModel.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';
import 'package:monstersmoke/features/Dashboard/domain/repositories/dashboardRepo.dart';
import 'package:monstersmoke/features/sharedPrefsApi.dart';

class DashboardRepoImp extends DashboardRepository {
  final DashboardApi dashboardApi;
  final SharedPrefsApi prefsApi;
  DashboardRepoImp({required this.dashboardApi, required this.prefsApi});

  @override
  Future<DataStates<DashboardModel>> getDashboard() async {
    try {
      final token = await prefsApi.getFromShared(key: 'login');
      final data = await dashboardApi.getDashboard(token: token);

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
  Future<DataStates<StatementModel>> getStatement(
      {required String? storeIds,
      required int? page,
      required int? size,
      required String? startDate,
      required String? endDate,
      required String? customerIds,
      required String? token}) async {
    try {
      final token = await prefsApi.getFromShared(key: 'login');
      final data = await dashboardApi.getStatement(
          storeIds: storeIds,
          page: page,
          size: size,
          startDate: startDate,
          endDate: endDate,
          customerIds: customerIds,
          token: token);

      if (data.response.statusCode == HttpStatus.ok) {
        return SuccessState(data: data.data);
      } else {
        return ErrorState(
            dioException: DioException(
                requestOptions: data.response.requestOptions,
                message: 'Cannot Get Statement Data'));
      }
    } on DioException catch (e) {
      return ErrorState(dioException: e);
    }
  }
}
