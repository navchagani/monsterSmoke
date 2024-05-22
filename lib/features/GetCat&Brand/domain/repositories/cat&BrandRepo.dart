import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

abstract class CatBrandRepo {
  Future<DataStates<List<CategoryModel>>> getCategories(
      {required String buissnessTypeId});
  Future<DataStates<List<Content>>> getBrands(
      {required String storeIds, required String brandIdList});
}
