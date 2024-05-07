import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

abstract class ProductsRepo {
  Future<DataStates<List<ProductModel>>> getProducts(
      {required String categoryIdList,
      required String page,
      required String size,
      required String sort,
      required String sortDirection,
      required String storeIds});
  Future<DataStates<ProductDetailModel>> getProductDetails(
      {required String storeIds, required String productId});
}
