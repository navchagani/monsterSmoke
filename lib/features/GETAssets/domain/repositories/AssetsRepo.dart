import 'package:monstersmoke/config/DataStates.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';

abstract class AssetsRepo {
  Future<DataStates<List<CountryModel>>> getCountries();
  Future<DataStates<List<StateModel>>> getStates({required String stateId});
  Future<DataStates<List<SliderModel>>> getSliders(
      {required String sliderId, required String buisnessId});
}
