import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Customer/domain/repositories/CustomerRepository.dart';

class CaseGetUserData extends CaseFuture<DataStates<CustomerModel?>, void> {
  final CustomerRepository repo;

  CaseGetUserData({required this.repo});

  @override
  Future<DataStates<CustomerModel?>> call({void params, String? token}) {
    return repo.getCustomer(token: token.toString());
  }
}

class CaseAddUserAddress
    extends CaseFuture<DataStates<CustomerStoreAddressList?>, void> {
  final CustomerRepository repo;

  CaseAddUserAddress({required this.repo});

  @override
  Future<DataStates<CustomerStoreAddressList?>> call(
      {void params, CustomerStoreAddressList? addressList}) {
    return repo.addCustomerAddress(addressList: addressList!);
  }
}

class CaseUpdateUserData extends CaseFuture<DataStates<CustomerModel?>, void> {
  final CustomerRepository repo;

  CaseUpdateUserData({required this.repo});

  @override
  Future<DataStates<CustomerModel?>> call(
      {void params, CustomerModel? customerModel}) {
    return repo.updateCustomer(customerModel: customerModel!);
  }
}

class CaseUpdateUserAddress
    extends CaseFuture<DataStates<CustomerStoreAddressList?>, void> {
  final CustomerRepository repo;

  CaseUpdateUserAddress({required this.repo});

  @override
  Future<DataStates<CustomerStoreAddressList?>> call(
      {void params, CustomerStoreAddressList? addressList}) {
    return repo.updateCustomerAddress(addressList: addressList!);
  }
}
