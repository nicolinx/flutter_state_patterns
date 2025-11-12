import 'package:flutter_state_boilerplate/src/feature/article/data/model/article.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/model/article_list_response.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/service/article_service.dart';

class ArticleRepository {
  final ArticleService _articleService;

  ArticleRepository(this._articleService);

  Future<ArticleListResponse> getArticles(int page, int limit) async {
    final response = await _articleService.getArticles(page, limit);

    if (response.status != 'success') {
      throw Exception(response.message ?? 'Error!');
    }

    if (response.data == null) {
      throw Exception('Empty data!');
    }

    return response.data!;
  }

  Future<Article> getArticlesById(int id) async {
    final response = await _articleService.getArticleById(id);

    if (response.status != 'success') {
      throw Exception(response.message ?? 'Error!');
    }

    if (response.data == null) {
      throw Exception('Empty data!');
    }

    return response.data!;
  }
}
