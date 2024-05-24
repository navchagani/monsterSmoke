part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class GetDashboardInitialEvent extends DashboardEvent {}

class GetDashboardEvent extends DashboardEvent {}

class GetStatementEvent extends DashboardEvent {
  final String? storeIds, startDate, customerIds, endDate;
  final int? page, size;

  const GetStatementEvent(
      {required this.storeIds,
      required this.startDate,
      required this.customerIds,
      required this.endDate,
      required this.page,
      required this.size});
}
