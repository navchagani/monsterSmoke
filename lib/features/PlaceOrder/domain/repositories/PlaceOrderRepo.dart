import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';

abstract class PlaceOrderRepo {
  Future<DataStates<PlaceOrderResModel>> placeOrder(
      {required PlaceOrderModel placeOrderModel,
      required String token,
      required String storeId});
  Future<DataStates<List<CustomerOrderModel>>> getCustomerOrder(
      {required String token, required int page, required int size});
  Future<DataStates<void>> getOrderDetails(
      {required String token,
      required String defaultStoreId,
      required String storeIdList,
      required String isEcommerce,
      required int orderNumber});
}
