// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CustomerApi implements CustomerApi {
  _CustomerApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://erp.monstersmokewholesale.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<CustomerStoreAddressList>> addCustomerAddress({
    required String token,
    required CustomerStoreAddressList addressList,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'Bearer $token'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(addressList.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CustomerStoreAddressList>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/customer/${addressList.id}/address',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final result = _result.data!['result'];
    final value = CustomerStoreAddressList.fromJson(result);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CustomerStoreAddressList>> updateCustomerAddress({
    required String token,
    required CustomerStoreAddressList addressList,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'Bearer $token'};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(addressList.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CustomerStoreAddressList>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/customer/1795/address',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final result = _result.data!['result'];
    final value = CustomerStoreAddressList.fromJson(result);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CustomerModel>> updateCustomer({
    required String token,
    required CustomerModel customerModel,
  }) async {
    log("Customer Data ${customerModel.toJson()}");
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'Bearer $token'};
    _headers.removeWhere((k, v) => v == null);
    final _data = customerModel.toJson();
    _data.addAll(customerModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CustomerModel>>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final result = _result.data!['result'];
    final value = CustomerModel.fromJson(result);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<CustomerModel?>> getCustomer(
      {required String token}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': 'Bearer $token'};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<CustomerModel?>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/customer',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final value = _result.data!['result'];
    final customerData = value['customerDto'];
    final model =
        _result.data == null ? null : CustomerModel.fromJson(customerData!);
    log('getcustomer data : ${_result.data}');

    final httpResponse = HttpResponse(model, _result);
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
