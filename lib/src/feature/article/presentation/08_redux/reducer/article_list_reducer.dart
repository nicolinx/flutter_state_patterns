import 'package:redux/redux.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/08_redux/redux.dart';

final articleListReducer = combineReducers<ArticleListState>([
  TypedReducer<ArticleListState, FetchArticlesAction>(_onFetch),
  TypedReducer<ArticleListState, FetchArticlesSuccessAction>(_onFetchSuccess),
  TypedReducer<ArticleListState, FetchArticlesFailedAction>(_onFetchFailed),

  TypedReducer<ArticleListState, LoadMoreArticlesAction>(_onLoadMore),
  TypedReducer<ArticleListState, LoadMoreArticlesSuccessAction>(
    _onLoadMoreSuccess,
  ),
  TypedReducer<ArticleListState, LoadMoreArticlesFailedAction>(
    _onLoadMoreFailed,
  ),

  TypedReducer<ArticleListState, RefreshArticlesAction>(_onRefresh),
]);

ArticleListState _onFetch(ArticleListState state, FetchArticlesAction action) {
  return state.copyWith(isLoading: true, isLoadingMore: false);
}

ArticleListState _onFetchSuccess(
  ArticleListState state,
  FetchArticlesSuccessAction action,
) {
  return state.copyWith(
    isLoading: false,
    articles: action.articles,
    hasMore: action.hasMore,
  );
}

ArticleListState _onFetchFailed(
  ArticleListState state,
  FetchArticlesFailedAction action,
) {
  return state.copyWith(isLoading: false);
}

ArticleListState _onLoadMore(
  ArticleListState state,
  LoadMoreArticlesAction action,
) {
  return state.copyWith(isLoadingMore: true);
}

ArticleListState _onLoadMoreSuccess(
  ArticleListState state,
  LoadMoreArticlesSuccessAction action,
) {
  return state.copyWith(
    isLoadingMore: false,
    articles: [...state.articles, ...action.articles],
    hasMore: action.hasMore,
  );
}

ArticleListState _onLoadMoreFailed(
  ArticleListState state,
  LoadMoreArticlesFailedAction action,
) {
  return state.copyWith(isLoadingMore: false);
}

ArticleListState _onRefresh(
  ArticleListState state,
  RefreshArticlesAction action,
) {
  return state.copyWith(isLoading: true, articles: [], hasMore: true);
}
