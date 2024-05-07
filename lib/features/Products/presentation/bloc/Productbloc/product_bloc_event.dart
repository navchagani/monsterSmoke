part of 'product_bloc_bloc.dart';

sealed class ProductBlocEvent extends Equatable {
  const ProductBlocEvent();

  @override
  List<Object> get props => [];
}

class ProductInitialEvent extends ProductBlocEvent {}

class GetProductEvent extends ProductBlocEvent {
  final String? categoryIdList, page, size, sort, sortDirection, storeIds;
  const GetProductEvent(this.storeIds, this.categoryIdList, this.page,
      this.size, this.sort, this.sortDirection);
}

class GetProductDetailEvent extends ProductBlocEvent {
  final String? storeIds, productId;
  const GetProductDetailEvent(this.storeIds, this.productId);
}
