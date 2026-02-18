import 'package:dio/dio.dart';
import 'package:flutter_state_patterns/src/core/config/app_config.dart';

class ApiClient {
  final Dio _client;

  ApiClient()
    : _client = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    return await _client.get(path, queryParameters: queryParams, data: data);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    return await _client.post(path, queryParameters: queryParams, data: data);
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    return await _client.put(path, queryParameters: queryParams, data: data);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
  }) async {
    return await _client.delete(path, queryParameters: queryParams, data: data);
  }
}
