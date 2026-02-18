// ignore_for_file: implicit_call_tearoffs

import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';

class ArticleDetailMiddleware {
  final ArticleRepository _articleRepository;

  ArticleDetailMiddleware(this._articleRepository);

  List<Middleware<AppState>> get middlewares => [
    TypedMiddleware<AppState, FetchArticleDetailAction>(_fetchDetail),
  ];

  Future<void> _fetchDetail(
    Store<AppState> store,
    FetchArticleDetailAction action,
    NextDispatcher next,
  ) async {
    next(action);

    try {
      final article = await _articleRepository.getArticlesById(
        action.articleId,
      );
      store.dispatch(FetchArticleDetailSuccessAction(article));
    } catch (e) {
      store.dispatch(FetchArticleDetailFailedAction(e.toString()));
    }
  }
}
