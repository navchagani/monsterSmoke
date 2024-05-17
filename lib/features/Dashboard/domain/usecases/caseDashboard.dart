import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Dashboard/data/models/dashboardModel.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';
import 'package:monstersmoke/features/Dashboard/domain/repositories/dashboardRepo.dart';

class CaseDashboard extends CaseFuture<DataStates<DashboardModel>, void> {
  final DashboardRepository repository;

  CaseDashboard({required this.repository});
  @override
  Future<DataStates<DashboardModel>> call({void params}) {
    return repository.getDashboard();
  }
}

class CaseGetStatement extends CaseFuture<DataStates<StatementModel>, void> {
  final DashboardRepository repository;

  CaseGetStatement({required this.repository});
  @override
  Future<DataStates<StatementModel>> call({
    void params,
    String? token,
    String? storeIds,
    String? startDate,
    String? customerIds,
    String? endDate,
    int? page,
    int? size,
  }) {
    return repository.getStatement(
        storeIds: storeIds,
        page: page,
        size: size,
        startDate: startDate,
        endDate: endDate,
        customerIds: customerIds,
        token: token);
  }
}
