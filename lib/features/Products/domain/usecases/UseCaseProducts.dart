import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductSearchModel.dart';
import 'package:monstersmoke/features/Products/data/models/TagProductModel.dart';
import 'package:monstersmoke/features/Products/domain/repositories/ProductsRepo.dart';

class CaseGetProducts extends CaseFuture<DataStates<List<ProductModel>>, void> {
  final ProductsRepo repo;

  CaseGetProducts({required this.repo});
  @override
  Future<DataStates<List<ProductModel>>> call(
      {void params,
      int? categoryIdList,
      int? page,
      int? size,
      String? sort,
      String? sortDirection,
      int? storeIds}) {
    return repo.getProducts(
        categoryIdList: categoryIdList,
        page: page,
        size: size,
        sort: sort.toString(),
        sortDirection: sortDirection.toString(),
        storeIds: storeIds);
  }
}

class CaseGetProductDetails
    extends CaseFuture<DataStates<ProductDetailModel>, void> {
  final ProductsRepo repo;

  CaseGetProductDetails({required this.repo});
  @override
  Future<DataStates<ProductDetailModel>> call(
      {void params, String? storeIds, String? productId}) {
    return repo.getProductDetails(
        storeIds: storeIds.toString(), productId: productId.toString());
  }
}

class CaseSearchProduct
    extends CaseFuture<DataStates<ProductSearchModel>, void> {
  final ProductsRepo repo;

  CaseSearchProduct({required this.repo});
  @override
  Future<DataStates<ProductSearchModel>> call(
      {void params, String? searchString}) {
    return repo.searchProducts(searchString: searchString.toString());
  }
}

class CaseGetTags extends CaseFuture<DataStates<List<TagProductModel>>, void> {
  final ProductsRepo repo;

  CaseGetTags({required this.repo});
  @override
  Future<DataStates<List<TagProductModel>>> call({void params}) {
    return repo.getTags();
  }
}

class CaseGetTaggedProducts
    extends CaseFuture<DataStates<List<ProductModel>>, void> {
  final ProductsRepo repo;

  CaseGetTaggedProducts({required this.repo});
  @override
  Future<DataStates<List<ProductModel>>> call({
    void params,
    int? page,
    int? size,
    int? storeId,
    int? buisnessTypeId,
    int? tagId,
  }) {
    return repo.getTaggedProducts(
        tagId: tagId ?? 0,
        page: page,
        size: size,
        storeId: storeId,
        buisnessTypeId: buisnessTypeId);
  }
}
