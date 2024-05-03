import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/Auth/data/models/CreateCustomerModel.dart';
import 'package:monstersmoke/features/Auth/data/models/CustomerModel.dart';
import 'package:monstersmoke/features/Auth/domain/repositories/AuthRepo.dart';

class CaseSignIn extends CaseFuture<DataStates<String?>, void> {
  final AuthRepo repo;

  CaseSignIn({required this.repo});

  @override
  Future<DataStates<String?>> call(
      {void params, String? email, String? password}) {
    return repo.signIn(email: email.toString(), password: password.toString());
  }
}

class CaseSignUp extends CaseFuture<DataStates<bool?>, void> {
  final AuthRepo repo;

  CaseSignUp({required this.repo});

  @override
  Future<DataStates<bool?>> call(
      {void params, CreateCustomerModel? customerModel}) {
    return repo.signUp(
        customerModel: customerModel ?? const CreateCustomerModel());
  }
}

class CaseGetUserData extends CaseFuture<DataStates<CustomerModel?>, void> {
  final AuthRepo repo;

  CaseGetUserData({required this.repo});

  @override
  Future<DataStates<CustomerModel?>> call({void params, String? token}) {
    return repo.getCustomerData(token: token.toString());
  }
}
