import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  factory ApiResponse({String? status, String? message, T? data}) =
      _ApiResponse;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}
