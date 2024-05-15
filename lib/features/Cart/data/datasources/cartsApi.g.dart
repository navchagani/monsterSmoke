// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartsApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CartApi implements CartApi {
  _CartApi(
    this._dio,
    this.sharedPrefsApi) {
    baseUrl ??= 'https://erp.monstersmokewholesale.com';
  }

  final Dio _dio;
  final SharedPrefsApi sharedPrefsApi;
  String? baseUrl;

  @override
  Future<HttpResponse<List<CartLineItemDtoList>>> addtoCart({
    required List<ProductModel> productModel,
    required String storeId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'storeId': storeId};
    final _headers = <String, dynamic>{
      'Authorization':
          'Bearer ${await sharedPrefsApi.getFromShared(key: 'login')}'
    };
    List<Map<String, dynamic>> _data =
        productModel.map((e) => e.toJson()).toList();

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<CartLineItemDtoList>>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/cartLineItem',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    List<dynamic> data = _result.data!['result'];
    var value = data
        .map((dynamic i) =>
            CartLineItemDtoList.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<UpdateCartModel>> getCart(
      {required String storeId}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'storeId': storeId};
    final _headers = <String, dynamic>{
      'Authorization':
          'Bearer ${await sharedPrefsApi.getFromShared(key: 'login')}'
    };
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<UpdateCartModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/cartLineItem/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final value = UpdateCartModel.fromJson(_result.data!['result']);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<List<CartLineItemDtoList>>> updateCart({
    required List<CartLineItemDtoList> updateCartModel,
    required String storeId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'storeId': storeId};
    final _headers = <String, dynamic>{
      'Authorization':
          'Bearer ${await sharedPrefsApi.getFromShared(key: 'login')}'
    };
    List<Map<String, Object?>> _data =
        updateCartModel.map((e) => e.toJson()).toList();
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<CartLineItemDtoList>>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/cartLineItem/updateAll',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    List<dynamic> data = _result.data!['result'];

    var value = data
        .map((dynamic i) =>
            CartLineItemDtoList.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<bool>> deleteFromCart({
    required List<CartLineItemDtoList> updateCartModel,
    required String storeId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'storeId': storeId};
    final _headers = <String, dynamic>{
      'Authorization':
          'Bearer ${await sharedPrefsApi.getFromShared(key: 'login')}'
    };
    List<Map<String, dynamic>> _data =
        updateCartModel.map((e) => e.toJson()).toList();
    final _result =
        await _dio.fetch<bool>(_setStreamType<HttpResponse<bool>>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/cartLineItem/clearSelected',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = _result.statusCode == 204 ? true : false;
    final httpResponse = HttpResponse(value, _result);
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
