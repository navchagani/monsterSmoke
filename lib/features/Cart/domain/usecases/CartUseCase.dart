import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Cart/domain/repositories/CartRepo.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

class CaseAddToCart
    extends CaseFuture<DataStates<List<CartLineItemDtoList>>, void> {
  final CartRepo repo;

  CaseAddToCart({required this.repo});
  @override
  Future<DataStates<List<CartLineItemDtoList>>> call(
      {void params, List<Content>? Content, String? storeId}) {
    return repo.addtoCart(Content: Content!, storeId: storeId.toString());
  }
}

class CaseGetCart extends CaseFuture<DataStates<UpdateCartModel>, void> {
  final CartRepo repo;

  CaseGetCart({required this.repo});
  @override
  Future<DataStates<UpdateCartModel>> call(
      {void params, Content? Content, String? storeId}) {
    return repo.getCart(storeId: storeId.toString());
  }
}

class CaseUpdateToCart
    extends CaseFuture<DataStates<List<CartLineItemDtoList>>, void> {
  final CartRepo repo;

  CaseUpdateToCart({required this.repo});
  @override
  Future<DataStates<List<CartLineItemDtoList>>> call(
      {void params,
      List<CartLineItemDtoList>? cartLineItemDtoList,
      String? storeId}) {
    return repo.updateCart(
        updateCartModel: cartLineItemDtoList!, storeId: storeId.toString());
  }
}

class CaseRemoveFromCart extends CaseFuture<DataStates<bool>, void> {
  final CartRepo repo;

  CaseRemoveFromCart({required this.repo});
  @override
  Future<DataStates<bool>> call(
      {void params,
      List<CartLineItemDtoList>? updateCartModel,
      String? storeId}) {
    return repo.deleteFromCart(
        storeId: storeId.toString(), updateCartModel: updateCartModel!);
  }
}
