import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';

abstract class AuthRepo {
  Future<DataStates<String?>> signIn(
      {required String email, required String password});
  Future<DataStates<CustomerModel?>> signUp(
      {required CreateCustomerModel createCustomerModel});
  Future<DataStates<void>> resetPassword(
      {required String? email, required String? token});
  Future<DataStates<void>> forgotPassword({required String? email});
  Future<DataStates<void>> changePassword(
      {required String? oldPassword,
      required String? password,
      required String? newPassword});
}
