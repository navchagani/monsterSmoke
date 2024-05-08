part of 'product_bloc_bloc.dart';

sealed class ProductBlocState extends Equatable {
  const ProductBlocState();

  @override
  List<Object> get props => [];
}

final class ProductBlocInitial extends ProductBlocState {}

class ProductLoadingState extends ProductBlocState {}

class ProductCompletedState extends ProductBlocState {
  final List<ProductModel> listProducts;

  const ProductCompletedState({required this.listProducts});
}

class ProductDetailCompletedState extends ProductBlocState {
  final ProductDetailModel productDetailModel;

  const ProductDetailCompletedState({required this.productDetailModel});
}

class SearchProductCompletedState extends ProductBlocState {
  final ProductSearchModel searchModel;

  const SearchProductCompletedState({required this.searchModel});
}

class ProductErrorState extends ProductBlocState {
  final DioException error;

  const ProductErrorState({required this.error});
}
