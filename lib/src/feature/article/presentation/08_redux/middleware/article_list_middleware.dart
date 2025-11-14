import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createArticleListMiddleware(ArticleRepository repo) {
  return [
    TypedMiddleware<AppState, FetchArticlesAction>(_fetchArticles(repo)),
    TypedMiddleware<AppState, LoadMoreArticlesAction>(_loadMore(repo)),
    TypedMiddleware<AppState, RefreshArticlesAction>(_refresh(repo)),
  ];
}

Middleware<AppState> _fetchArticles(ArticleRepository repo) {
  return (store, action, next) async {
    next(action);

    try {
      final response = await repo.getArticles(1, 20);

      store.dispatch(
        FetchArticlesSuccessAction(
          response.articles ?? [],
          response.hasMore ?? false,
        ),
      );
    } catch (e) {
      store.dispatch(FetchArticlesFailedAction(e.toString()));
    }
  };
}

Middleware<AppState> _loadMore(ArticleRepository repo) {
  return (store, action, next) async {
    next(action);

    final state = store.state.articleListState;
    if (!state.hasMore || state.isLoadingMore) return;

    final nextPage = (state.articles.length ~/ 20) + 1;

    try {
      final response = await repo.getArticles(nextPage, 20);

      store.dispatch(
        LoadMoreArticlesSuccessAction(
          response.articles ?? [],
          response.hasMore ?? false,
        ),
      );
    } catch (e) {
      store.dispatch(LoadMoreArticlesFailedAction(e.toString()));
    }
  };
}

Middleware<AppState> _refresh(ArticleRepository repo) {
  return (store, action, next) async {
    next(action);
    store.dispatch(FetchArticlesAction()); // simply refetch
  };
}
