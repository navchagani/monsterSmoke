part of 'get_pages_bloc.dart';

sealed class GetPagesState extends Equatable {
  const GetPagesState();

  @override
  List<Object> get props => [];
}

final class GetPagesInitial extends GetPagesState {}

class GetPagesLoadingState extends GetPagesState {}

class GetPagesCompletedState extends GetPagesState {
  final HtmlModel htmlModel;

  const GetPagesCompletedState({required this.htmlModel});
}

class GetPagesErrorState extends GetPagesState {
  final DioException error;

  const GetPagesErrorState({required this.error});
}
