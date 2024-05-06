part of 'country_bloc_bloc.dart';

sealed class CountryBlocState extends Equatable {
  const CountryBlocState();

  @override
  List<Object> get props => [];
}

final class CountryBlocInitial extends CountryBlocState {}

class CountryLoadingCountry extends CountryBlocState {}

class CountryCompletedCountry extends CountryBlocState {
  final List<CountryModel> lilstContries;

  const CountryCompletedCountry({required this.lilstContries});
}

class CountryErrorCountry extends CountryBlocState {
  final DioException error;

  const CountryErrorCountry({required this.error});
}
