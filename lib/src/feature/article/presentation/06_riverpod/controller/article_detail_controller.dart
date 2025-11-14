import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/06_riverpod/riverpod.dart';

class ArticleDetailController extends StateNotifier<ArticleDetailState> {
  final ArticleRepository _articleRepository;

  ArticleDetailController(this._articleRepository)
    : super(const ArticleDetailState.initial());

  Future<void> onFetchArticleById(id) async {
    state = const ArticleDetailState.loading();
    try {
      final article = await _articleRepository.getArticlesById(id);
      state = ArticleDetailState.loaded(article);
    } catch (e) {
      state = ArticleDetailState.error(e.toString());
    }
  }
}
