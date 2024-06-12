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
  Future<HttpResponse> getCountries();
  @GET('/api/country/stateid/allState')
  Future<HttpResponse> getStates({required String stateId});
  @GET('/api/home/sliderImages')
  Future<HttpResponse> getSliders(
      {@Query('sliderTypeId') required String sliderId,
      @Query('businessTypeId') required String buisnessId});

  @GET('/api/store/paymentMode')
  Future<HttpResponse> getPaymentMethods();

  @GET('/api/shipping/options')
  Future<HttpResponse> getShippingAddress();

  @GET('/api/ecommerce/staticPage')
  Future<HttpResponse> getPage({@Query('alias') required String alias});
}
