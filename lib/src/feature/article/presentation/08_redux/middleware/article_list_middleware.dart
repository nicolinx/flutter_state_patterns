// ignore_for_file: implicit_call_tearoffs

import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';

class ArticleListMiddleware {
  final ArticleRepository _articleRepository;
  int _page = 1;

  ArticleListMiddleware(this._articleRepository);

  List<Middleware<AppState>> get middlewares => [
    TypedMiddleware<AppState, FetchArticlesAction>(_fetchArticles),
    TypedMiddleware<AppState, LoadMoreArticlesAction>(_loadMore),
    TypedMiddleware<AppState, RefreshArticlesAction>(_refresh),
  ];

  Future<void> _fetchArticles(
    Store<AppState> store,
    FetchArticlesAction action,
    NextDispatcher next,
  ) async {
    next(action);

    try {
      final response = await _articleRepository.getArticles(_page, 20);

      store.dispatch(
        FetchArticlesSuccessAction(
          response.articles ?? [],
          response.hasMore ?? false,
        ),
      );
    } catch (e) {
      store.dispatch(FetchArticlesFailedAction(e.toString()));
    }
  }

  Future<void> _loadMore(
    Store<AppState> store,
    LoadMoreArticlesAction action,
    NextDispatcher next,
  ) async {
    final state = store.state.articleListState;
    if (!state.hasMore || state.isLoadingMore) return;

    next(action);
    try {
      final response = await _articleRepository.getArticles(++_page, 20);

      store.dispatch(
        LoadMoreArticlesSuccessAction(
          response.articles ?? [],
          response.hasMore ?? false,
        ),
      );
    } catch (e) {
      store.dispatch(LoadMoreArticlesFailedAction(e.toString()));
    }
  }

  Future<void> _refresh(
    Store<AppState> store,
    RefreshArticlesAction action,
    NextDispatcher next,
  ) async {
    next(action);
    _page = 1;
    store.dispatch(FetchArticlesAction());
  }
}
