part of 'state_bloc_bloc.dart';

sealed class StateBlocState extends Equatable {
  const StateBlocState();

  @override
  List<Object> get props => [];
}

final class StateBlocInitial extends StateBlocState {}

class StateLoadingState extends StateBlocState {}

class StateCompletedState extends StateBlocState {
  final List<StateModel> lilstContries;

  const StateCompletedState({required this.lilstContries});
}

class StateErrorState extends StateBlocState {
  final DioException error;

  const StateErrorState({required this.error});
}
