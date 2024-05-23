part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  final DashboardModel? dashboardModel;
  const DashboardState({this.dashboardModel});

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadedState extends DashboardState {
  final DashboardModel dashboardModel;

  const DashboardLoadedState({required this.dashboardModel});
}

class StatementLoadedState extends DashboardState {
  final StatementModel statementModel;

  const StatementLoadedState({required this.statementModel});
}

class DashboardErrorState extends DashboardState {
  final String error;

  const DashboardErrorState({required this.error});
}
