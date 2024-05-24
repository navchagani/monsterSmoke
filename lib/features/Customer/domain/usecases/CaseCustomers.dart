import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/domain/repositories/CustomerRepository.dart';

class CaseGetCustomerData extends CaseFuture<DataStates<CustomerModel?>, void> {
  final CustomerRepository repo;

  CaseGetCustomerData({required this.repo});

  @override
  Future<DataStates<CustomerModel?>> call({void params, String? token}) {
    return repo.getCustomer(token: token.toString());
  }
}

class CaseAddCustomerAddress
    extends CaseFuture<DataStates<CustomerStoreAddressList?>, void> {
  final CustomerRepository repo;

  CaseAddCustomerAddress({required this.repo});

  @override
  Future<DataStates<CustomerStoreAddressList?>> call(
      {void params, CustomerStoreAddressList? addressList}) {
    return repo.addCustomerAddress(addressList: addressList!);
  }
}

class CaseUpdateCustomerData extends CaseFuture<DataStates<bool?>, void> {
  final CustomerRepository repo;

  CaseUpdateCustomerData({required this.repo});

  @override
  Future<DataStates<bool?>> call({void params, CustomerModel? customerModel}) {
    return repo.updateCustomer(customerModel: customerModel!);
  }
}

class CaseUpdateCustomerAddress
    extends CaseFuture<DataStates<CustomerStoreAddressList?>, void> {
  final CustomerRepository repo;

  CaseUpdateCustomerAddress({required this.repo});

  @override
  Future<DataStates<CustomerStoreAddressList?>> call(
      {void params, CustomerStoreAddressList? addressList}) {
    return repo.updateCustomerAddress(addressList: addressList!);
  }
}
