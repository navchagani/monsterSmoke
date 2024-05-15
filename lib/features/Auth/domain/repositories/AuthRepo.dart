import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';

abstract class AuthRepo {
  Future<DataStates<String?>> signIn(
      {required String email, required String password});
  Future<DataStates<CustomerModel?>> signUp(
      {required CreateCustomerModel createCustomerModel});
}
