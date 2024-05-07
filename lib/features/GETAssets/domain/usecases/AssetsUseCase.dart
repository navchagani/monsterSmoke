import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/config/useCases.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/domain/repositories/AssetsRepo.dart';

class CaseGetSliders extends CaseFuture<DataStates<List<SliderModel>>, void> {
  final AssetsRepo repo;

  CaseGetSliders({required this.repo});
  @override
  Future<DataStates<List<SliderModel>>> call(
      {void params, String? sliderId, String? buisnessId}) {
    return repo.getSliders(
        sliderId: sliderId.toString(), buisnessId: buisnessId.toString());
  }
}

class CaseGetCountries
    extends CaseFuture<DataStates<List<CountryModel>>, void> {
  final AssetsRepo repo;

  CaseGetCountries({required this.repo});
  @override
  Future<DataStates<List<CountryModel>>> call({void params}) {
    return repo.getCountries();
  }
}

class CaseGetStates extends CaseFuture<DataStates<List<StateModel>>, void> {
  final AssetsRepo repo;

  CaseGetStates({required this.repo});
  @override
  Future<DataStates<List<StateModel>>> call({void params, String? stateId}) {
    return repo.getStates(stateId: stateId.toString());
  }
}

class CaseGetShippingAddresses
    extends CaseFuture<DataStates<List<ShippingAddressModel>>, void> {
  final AssetsRepo repo;

  CaseGetShippingAddresses({required this.repo});
  @override
  Future<DataStates<List<ShippingAddressModel>>> call({void params}) {
    return repo.getShippingAddress();
  }
}

class CaseGetPayments
    extends CaseFuture<DataStates<List<PaymentsModel>>, void> {
  final AssetsRepo repo;

  CaseGetPayments({required this.repo});
  @override
  Future<DataStates<List<PaymentsModel>>> call({void params}) {
    return repo.getPaymentMethods();
  }
}
