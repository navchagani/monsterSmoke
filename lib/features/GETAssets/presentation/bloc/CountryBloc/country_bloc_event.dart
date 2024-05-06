part of 'country_bloc_bloc.dart';

sealed class CountryBlocEvent extends Equatable {
  const CountryBlocEvent();

  @override
  List<Object> get props => [];
}

class CountryInitialEvent extends CountryBlocEvent {}

class GetCountryEvent extends CountryBlocEvent {
  const GetCountryEvent();
}
