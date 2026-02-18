import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/01_setstate/setstate.dart';

class ArticleDetailController {
  ArticleDetailState state = const ArticleDetailState.initial();
  final ArticleRepository _articleRepository;
  late final Function(ArticleDetailState) _listener;

  ArticleDetailController(this._articleRepository);

  void setListener(void Function(ArticleDetailState) listener) {
    _listener = listener;
  }

  void setState(ArticleDetailState newState) {
    state = newState;
    _listener.call(newState);
  }

  Future<void> onFetchArticleById(id) async {
    setState(const ArticleDetailState.loading());
    try {
      final article = await _articleRepository.getArticlesById(id);
      setState(ArticleDetailState.loaded(article));
    } catch (e) {
      setState(ArticleDetailState.error(e.toString()));
    }
  }
}
