import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/05_getx/getx.dart';
import 'package:get/get.dart';

class ArticleDetailController extends GetxController {
  final ArticleRepository _articleRepository;
  final state = ArticleDetailState.initial().obs;

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
