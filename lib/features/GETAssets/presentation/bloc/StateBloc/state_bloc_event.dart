part of 'state_bloc_bloc.dart';

sealed class StateBlocEvent extends Equatable {
  const StateBlocEvent();

  @override
  List<Object> get props => [];
}

class StateInitialEvent extends StateBlocEvent {}

class GetStateEvent extends StateBlocEvent {
  final String stateId;

  const GetStateEvent({required this.stateId});
}
