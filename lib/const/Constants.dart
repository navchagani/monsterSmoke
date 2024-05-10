import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Constants {
  static const baseUrl = 'https://erp.monstersmokewholesale.com';

  static options(Dio dio) => dio.options..validateStatus = dioOptions;

  static bool dioOptions(int? integer) {
    return integer != null;
  }

  static const monsterBlue = Color(0xFF3c3b6e);
  static const monsterRed = Color(0xFFb22234);
}
