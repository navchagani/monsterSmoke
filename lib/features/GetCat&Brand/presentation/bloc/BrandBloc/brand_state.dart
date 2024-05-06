part of 'brand_bloc.dart';

sealed class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}

class BrandLoadingBrand extends BrandState {}

class BrandCompletedBrand extends BrandState {
  final List<BrandModel> lilstContries;

  const BrandCompletedBrand({required this.lilstContries});
}

class BrandErrorBrand extends BrandState {
  final DioException error;

  const BrandErrorBrand({required this.error});
}
