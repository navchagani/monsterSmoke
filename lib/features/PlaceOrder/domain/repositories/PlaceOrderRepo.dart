import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';

abstract class PlaceOrderRepo {
  Future<DataStates<PlaceOrderResModel>> placeOrder(
      {required PlaceOrderModel placeOrderModel});
  // Future<DataStates<>> getCustomerOrder();
  // Future<DataStates<>> getOrderDetails();
}
