import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/BrandModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';

abstract class CatBrandRepo {
  Future<DataStates<List<CategoryModel>>> getCategories(
      {required String buissnessTypeId});
  Future<DataStates<List<BrandModel>>> getBrands(
      {required String storeIds, required String brandIdList});
}
