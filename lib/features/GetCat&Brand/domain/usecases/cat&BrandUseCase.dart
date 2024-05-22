import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/GetCat&Brand/data/models/CategoryModel.dart';
import 'package:monstersmoke/features/GetCat&Brand/domain/repositories/cat&BrandRepo.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';

class CaseGetBrands extends CaseFuture<DataStates<List<Content>>, void> {
  final CatBrandRepo repo;

  CaseGetBrands({required this.repo});
  @override
  Future<DataStates<List<Content>>> call(
      {void params, String? storeIds, String? brandIdList}) {
    return repo.getBrands(
        storeIds: storeIds.toString(), brandIdList: brandIdList.toString());
  }
}

class CaseGetCategories
    extends CaseFuture<DataStates<List<CategoryModel>>, void> {
  final CatBrandRepo repo;

  CaseGetCategories({required this.repo});
  @override
  Future<DataStates<List<CategoryModel>>> call(
      {void params, String? buissnessTypeId}) {
    return repo.getCategories(buissnessTypeId: buissnessTypeId.toString());
  }
}
