import 'package:dio/dio.dart';

class Constants {
  static const baseUrl = 'https://erp.monstersmokewholesale.com';

  static options(Dio dio) => dio.options..validateStatus = dioOptions;

  static bool dioOptions(int? integer) {
    return integer != null;
  }
}
