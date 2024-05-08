
import 'package:dio/dio.dart';
import 'package:monstersmoke/const/Constants.dart';
import 'package:monstersmoke/features/GETAssets/data/models/CountryModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/SliderModel.dart';
import 'package:monstersmoke/features/GETAssets/data/models/StateModel.dart';
import 'package:retrofit/retrofit.dart';

part 'AssetsApi.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AssetsApi {
  factory AssetsApi(Dio dio) = _AssetsApi;

  @GET('/api/country/all')
  Future<HttpResponse<List<CountryModel>>> getCountries();
  @GET('/api/country/stateid/allState')
  Future<HttpResponse<List<StateModel>>> getStates({required String stateId});
  @GET('/api/home/sliderImages')
  Future<HttpResponse<List<SliderModel>>> getSliders(
      {@Query('sliderTypeId') required String sliderId,
      @Query('businessTypeId') required String buisnessId});

  @GET('/api/store/paymentMode')
  Future<HttpResponse<List<SliderModel>>> getPaymentMethods();

  @GET('/api/shipping/options')
  Future<HttpResponse<List<SliderModel>>> getShippingAddress();
}
