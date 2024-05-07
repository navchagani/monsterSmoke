import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/domain/repositories/ProductsRepo.dart';

class CaseGetProducts extends CaseFuture<DataStates<List<ProductModel>>, void> {
  final ProductsRepo repo;

  CaseGetProducts({required this.repo});
  @override
  Future<DataStates<List<ProductModel>>> call(
      {void params,
      String? categoryIdList,
      String? page,
      String? size,
      String? sort,
      String? sortDirection,
      String? storeIds}) {
    return repo.getProducts(
        categoryIdList: categoryIdList.toString(),
        page: page.toString(),
        size: size.toString(),
        sort: sort.toString(),
        sortDirection: sortDirection.toString(),
        storeIds: storeIds.toString());
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
