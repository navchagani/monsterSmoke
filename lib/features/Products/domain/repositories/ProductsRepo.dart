import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

abstract class ProductsRepo {
  Future<DataStates<List<ProductModel>>> getProducts(
      {required int? categoryIdList,
      required int? page,
      required int? size,
      required String? sort,
      required String? sortDirection,
      required int? storeIds});
  Future<DataStates<ProductDetailModel>> getProductDetails(
      {required String storeIds, required String productId});
}
