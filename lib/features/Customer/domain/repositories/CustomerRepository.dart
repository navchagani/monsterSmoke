import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';

abstract class CustomerRepository {
  Future<DataStates<CustomerStoreAddressList>> addCustomerAddress(
      {required CustomerStoreAddressList addressList});
  Future<DataStates<CustomerStoreAddressList>> updateCustomerAddress(
      {required CustomerStoreAddressList addressList});
  Future<DataStates<bool>> updateCustomer(
      {required CustomerModel customerModel});
  Future<DataStates<CustomerModel>> getCustomer({required String token});
}
