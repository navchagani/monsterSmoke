part of 'product_bloc_bloc.dart';

sealed class ProductBlocState extends Equatable {
  const ProductBlocState();

  @override
  List<Object> get props => [];
}

final class ProductBlocInitial extends ProductBlocState {}

class ProductLoadingState extends ProductBlocState {}

class ProductCompletedState extends ProductBlocState {
  final ProductModel productModel;

  const ProductCompletedState({required this.productModel});
}

class ProductDetailCompletedState extends ProductBlocState {
  final ProductDetailModel productDetailModel;

  const ProductDetailCompletedState({required this.productDetailModel});
}

class SearchProductCompletedState extends ProductBlocState {
  final ProductSearchModel searchModel;

  const SearchProductCompletedState({required this.searchModel});
}

class TagsLoadedState extends ProductBlocState {
  final List<TagContent> tagsList;

  const TagsLoadedState({required this.tagsList});
}

// class TagsProductsLoadedState extends ProductBlocState {
//   final List<Content> tagsList;

//   const TagsProductsLoadedState({required this.tagsList});
// }

class ProductErrorState extends ProductBlocState {
  final DioException error;

  const ProductErrorState({required this.error});
}
