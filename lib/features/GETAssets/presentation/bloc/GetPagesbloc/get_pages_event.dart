part of 'get_pages_bloc.dart';

sealed class GetPagesEvent extends Equatable {
  const GetPagesEvent();

  @override
  List<Object> get props => [];
}

class GetPagesInitialEvent extends GetPagesEvent {}

class GetPageEvent extends GetPagesEvent {
  final String alias;
  const GetPageEvent(this.alias);
}
