// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://www.metaweather.com/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getLocation(keyword) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': keyword};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/location/search/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = City.fromJson(_result.data);
    return value;
  }

  @override
  getWeather(woeid) async {
    ArgumentError.checkNotNull(woeid, 'woeid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/location/$woeid',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WeatherReport.fromJson(_result.data);
    return value;
  }
}
