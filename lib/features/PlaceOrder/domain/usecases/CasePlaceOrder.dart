import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/CustomerOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/PlaceOrderResModel.dart';
import 'package:monstersmoke/features/PlaceOrder/data/models/placeOrderModel.dart';
import 'package:monstersmoke/features/PlaceOrder/domain/repositories/PlaceOrderRepo.dart';

class CasePlaceOrder extends CaseFuture<DataStates<PlaceOrderResModel>, void> {
  final PlaceOrderRepo repo;

  CasePlaceOrder({required this.repo});
  @override
  Future<DataStates<PlaceOrderResModel>> call(
      {void params,
      PlaceOrderModel? placeOrderModel,
      String? token,
      String? storeId}) {
    return repo.placeOrder(
        placeOrderModel: placeOrderModel!,
        token: token.toString(),
        storeId: storeId.toString());
  }
}

class CaseGetCustomerOrder
    extends CaseFuture<DataStates<List<CustomerOrderModel>>, void> {
  final PlaceOrderRepo repo;

  CaseGetCustomerOrder({required this.repo});
  @override
  Future<DataStates<List<CustomerOrderModel>>> call(
      {void params, int? page, int? size}) {
    return repo.getCustomerOrder(page: page ?? 0, size: size ?? 0);
  }
}

class CaseOrderDetails extends CaseFuture<DataStates<String?>, void> {
  final PlaceOrderRepo repo;

  CaseOrderDetails({required this.repo});
  @override
  Future<DataStates<String?>> call(
      {void params,
      String? token,
      String? defaultStoreId,
      String? storeIdList,
      bool? isEcommerce,
      int? orderNumber}) {
    return repo.getOrderDetails(
        token: token.toString(),
        defaultStoreId: defaultStoreId.toString(),
        storeIdList: storeIdList.toString(),
        isEcommerce: isEcommerce ?? false,
        orderNumber: orderNumber ?? 0);
  }
}
