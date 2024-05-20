import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/PaymentsModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/ShippingAddressModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/htmlModel.dart';

abstract class AssetsRepo {
  Future<DataStates<List<CountryModel>>> getCountries();
  Future<DataStates<List<StateModel>>> getStates({required String stateId});
  Future<DataStates<List<SliderModel>>> getSliders(
      {required String sliderId, required String buisnessId});

  Future<DataStates<List<PaymentsModel>>> getPaymentMethods();
  Future<DataStates<List<ShippingAddressModel>>> getShippingAddress();

  Future<DataStates<HtmlModel>> getPage({required String alias});
}
