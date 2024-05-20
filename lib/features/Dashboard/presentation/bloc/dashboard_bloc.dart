import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Dashboard/data/models/dashboardModel.dart';
import 'package:monstersmoke/features/Dashboard/data/models/statementModel.dart';
import 'package:monstersmoke/features/Dashboard/domain/usecases/caseDashboard.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CaseDashboard caseDashboard;
  final CaseGetStatement caseGetStatement;

  DashboardBloc(this.caseDashboard, this.caseGetStatement)
      : super(DashboardInitial()) {
    on<GetDashboardInitialEvent>(initial);
    on<GetDashboardEvent>(getDashboard);
    on<GetStatementEvent>(getStatement);
  }

  FutureOr<void> initial(
      GetDashboardInitialEvent event, Emitter<DashboardState> emit) {
    emit(DashboardInitial());
  }

  Future<FutureOr<void>> getDashboard(
      GetDashboardEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());

    final data = await caseDashboard();

    if (data is SuccessState) {
      emit(DashboardLoadedState(dashboardModel: data.data!));
    }

    if (data is ErrorState) {
      emit(DashboardErrorState(error: data.error!.message.toString()));
    }
  }

  Future<FutureOr<void>> getStatement(
      GetStatementEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());

    final data = await caseGetStatement(
        page: event.page,
        size: event.size,
        startDate: event.startDate,
        storeIds: event.storeIds,
        endDate: event.endDate,
        customerIds: event.customerIds);

    if (data is SuccessState) {
      emit(StatementLoadedState(statementModel: data.data!));
    }

    if (data is ErrorState) {
      emit(DashboardErrorState(error: data.error!.message.toString()));
    }
  }
}
