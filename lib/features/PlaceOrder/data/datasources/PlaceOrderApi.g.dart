// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaceOrderApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PlaceOrderApi implements PlaceOrderApi {
  _PlaceOrderApi(
    this._dio) {
    baseUrl ??= 'https://erp.monstersmokewholesale.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<PlaceOrderResModel>> placeOrder(
      {required PlaceOrderModel placeOrderModel,
      required String token,
      required String storeId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(placeOrderModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<PlaceOrderResModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/order?storeId=$storeId',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PlaceOrderResModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<CustomerOrderModel>>> getCustomerOrder({
    required String token,
    required int page,
    required int size,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': size};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<CustomerOrderModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/dashboard/orderTable?page=$page&size=$size',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final data = _result.data!['result'];
    List<dynamic> content = data!['content'];

    var value = content
        .map((dynamic i) =>
            CustomerOrderModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<void>> getOrderDetails(
      {required String token,
      required String defaultStoreId,
      required String storeIdList,
      required String isEcommerce,
      required int orderNumber}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'token': token,
      r'defaultStoreId': defaultStoreId,
      r'storeIdList': storeIdList,
      r'isEcommerce': isEcommerce,
    };
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/services/pdf/sales-order/invoice/$orderNumber?token=$token&defaultStoreId=$defaultStoreId&storeIdList=$storeIdList&isEcommerce=$isEcommerce',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
