// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiUserClient implements ApiUserClient {
  _ApiUserClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gorest.co.in';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User_Respone> getUser(token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<User_Respone>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/public/v2/users/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User_Respone.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User_Create> registerUser(token, body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<User_Create>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/public/v2/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User_Create.fromJson(_result.data!);
    return value;
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
}
