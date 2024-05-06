part of 'brand_bloc.dart';

sealed class BrandEvent extends Equatable {
  const BrandEvent();

  @override
  List<Object> get props => [];
}

class BrandInitialEvent extends BrandEvent {}

class GetBrandEvent extends BrandEvent {
  const GetBrandEvent();
}
