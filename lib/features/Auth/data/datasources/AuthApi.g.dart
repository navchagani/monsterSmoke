// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthApi.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AuthApi implements AuthApi {
  _AuthApi(this._dio) {
    baseUrl ??= 'https://erp.monstersmokewholesale.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse> signIn({
    required String email,
    required String password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'username': email, 'password': password, 'type': 'customer'};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<String>>(dio.Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/authenticate',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final httpResponse = HttpResponse(_result.data, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> signUp(
      {required CreateCustomerModel createCustomerModel}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = dio.FormData.fromMap(
        {'customerObj': jsonEncode(createCustomerModel.toJson())});

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<bool>>(dio.Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              Constants.options(_dio),
              '/api/ecommerce/customer/withDocuments',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    final httpResponse = HttpResponse(_result.data, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> resetPassword({
    String? email,
    String? token,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'token': token,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ecommerce/customer/resetPassword?email=email&token=token',
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

  @override
  Future<HttpResponse> changePassword(
      {String? oldPassword,
      String? password,
      String? newPassword,
      String? token}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{'Authorization': 'Bearer $token'};
    final _data = {
      "oldPassword": oldPassword,
      "password": password,
      "confirmPassword": newPassword
    };
    final _result =
        await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ecommerce/customer/changePassword',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    log('Status: ${_result.statusCode}');
    final httpResponse = HttpResponse(null, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse> forgotPassword({required String? email}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{"email": email.toString()};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    Map<String, dynamic>? _data = {};
    final _result =
        await _dio.fetch<void>(_setStreamType<HttpResponse<void>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/ecommerce/customer/sendForgotPasswordEmail',
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
