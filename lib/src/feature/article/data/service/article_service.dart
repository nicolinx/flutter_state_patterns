import 'package:flutter_state_boilerplate/src/core/model/api_response/api_response.dart';
import 'package:flutter_state_boilerplate/src/core/network/api_client.dart';
import 'package:flutter_state_boilerplate/src/core/network/api_endpoints.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/model/article.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/model/article_list_response.dart';

class ArticleService {
  final ApiClient _client;

  ArticleService(this._client);

  Future<ApiResponse<ArticleListResponse>> getArticles(
    int page,
    int limit,
  ) async {
    final response = await _client.get(
      ApiEndpoints.getArticles,
      queryParams: {'page': page, 'limit': limit},
    );
    return ApiResponse.fromJson(
      response.data,
      (data) => ArticleListResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResponse<Article>> getArticleById(int id) async {
    final response = await _client.get(ApiEndpoints.getArticleById(id));
    return ApiResponse.fromJson(
      response.data,
      (data) => Article.fromJson(data as Map<String, dynamic>),
    );
  }
}
