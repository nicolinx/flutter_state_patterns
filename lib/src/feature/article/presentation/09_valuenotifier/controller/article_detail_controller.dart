import 'package:flutter/widgets.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/09_valuenotifier/valuenotifier.dart';
import 'package:get/get.dart';

class ArticleDetailController extends GetxController {
  final ArticleRepository _articleRepository;
  final state = ValueNotifier(const ArticleDetailState.initial());

  ArticleDetailController(this._articleRepository);

  Future<void> onFetchArticleById(id) async {
    state.value = const ArticleDetailState.loading();
    try {
      final article = await _articleRepository.getArticlesById(id);
      state.value = ArticleDetailState.loaded(article);
    } catch (e) {
      state.value = ArticleDetailState.error(e.toString());
    }
  }
}
