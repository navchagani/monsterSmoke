import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/models/ProductDetailsModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductSearchModel.dart';
import 'package:monstersmoke/features/Products/data/models/TagProductModel.dart';

abstract class ProductsRepo {
  Future<DataStates<ProductModel>> getProducts(
      {required int? categoryIdList,
      required int? page,
      required int? size,
      required String? sort,
      required String? sortDirection,
      required int? storeIds});
  Future<DataStates<ProductDetailModel>> getProductDetails(
      {required String storeIds, required String productId});
  Future<DataStates<ProductSearchModel>> searchProducts(
      {required String searchString});
  Future<DataStates<List<TagContent>>> getTags();
  Future<DataStates<ProductModel>> getTaggedProducts(
      {required int tagId,
      required int? page,
      required int? size,
      required int? storeId,
      required int? buisnessTypeId});
}
