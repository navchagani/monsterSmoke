import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/Dashboard/data/models/dashboardModel.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboardApi.g.dart';

abstract class DashboardApi {
  factory DashboardApi(Dio dio) = _DashboardApi;

  @GET('/api/ecommerce/dashboard')
  Future<HttpResponse> getDashboard(
      {@Header('Authorization') required String? token});
  @GET('/api/ecommerce/customer/report/statement')
  Future<HttpResponse> getStatement(
      {@Query('storeIds') required String? storeIds,
      @Query('page') required int? page,
      @Query('size') required int? size,
      @Query('startDate') required String? startDate,
      @Query('endDate') required String? endDate,
      @Query('customerIds') required String? customerIds,
      @Header('Authorization') required String? token});
}
