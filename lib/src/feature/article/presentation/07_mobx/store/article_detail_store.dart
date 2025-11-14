import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart';
import 'package:mobx/mobx.dart';

part 'article_detail_store.g.dart';

class ArticleDetailStore = _ArticleDetailStore with _$ArticleDetailStore;

abstract class _ArticleDetailStore with Store {
  final ArticleRepository _articleRepository;

  _ArticleDetailStore(this._articleRepository);

  @observable
  ArticleDetailState state = const ArticleDetailState.initial();

  @action
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
