import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Dashboard/data/models/dashboardModel.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';

abstract class DashboardRepository {
  Future<DataStates<DashboardModel>> getDashboard();

  Future<DataStates<StatementModel>> getStatement(
      {required String? storeIds,
      required int? page,
      required int? size,
      required String? startDate,
      required String? endDate,
      required String? customerIds,
      required String? token});
}
