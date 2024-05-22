part of 'product_bloc_bloc.dart';

sealed class ProductBlocEvent extends Equatable {
  const ProductBlocEvent();

  @override
  List<Object> get props => [];
}

class ProductInitialEvent extends ProductBlocEvent {}

class GetProductEvent extends ProductBlocEvent {
  final String? sort, sortDirection;
  final int? categoryIdList, page, size, storeIds;

  const GetProductEvent(
      {this.storeIds,
      this.categoryIdList,
      this.page,
      this.size,
      this.sort,
      this.sortDirection});
}

class GetProductDetailEvent extends ProductBlocEvent {
  final String? storeIds, productId;
  const GetProductDetailEvent(this.storeIds, this.productId);
}

class SearchProductEvent extends ProductBlocEvent {
  final String? searchString;
  const SearchProductEvent(this.searchString);
}

class GetTagProductEvents extends ProductBlocEvent {
  final int? tagId, page, size, storeIds, buisnessTypeId;
  const GetTagProductEvents(
      this.tagId, this.page, this.size, this.storeIds, this.buisnessTypeId);
}

class GetTagsEvent extends ProductBlocEvent {
  const GetTagsEvent();
}
