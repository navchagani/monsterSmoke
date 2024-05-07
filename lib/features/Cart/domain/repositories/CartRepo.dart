import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Products/data/models/ProductModel.dart';
import 'package:monstersmoke/features/Products/data/models/updateCartModel.dart';

abstract class CartRepo {
  Future<DataStates<List<CartLineItemDtoList>>> addtoCart(
      {required List<ProductModel> productModel, required String storeId});
  Future<DataStates<UpdateCartModel>> getCart({required String storeId});
  Future<DataStates<List<CartLineItemDtoList>>> updateCart(
      {required List<UpdateCartModel> updateCartModel,
      required String storeId});
  Future<DataStates<bool>> deleteFromCart(
      {required List<UpdateCartModel> updateCartModel,
      required String storeId});
}
