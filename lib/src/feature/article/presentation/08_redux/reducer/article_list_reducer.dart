// ignore_for_file: implicit_call_tearoffs

import 'package:redux/redux.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';

class ArticleListReducer {
  static Reducer<ArticleListState> get reducer =>
      combineReducers<ArticleListState>([
        TypedReducer<ArticleListState, FetchArticlesAction>(_onFetch.call),
        TypedReducer<ArticleListState, FetchArticlesSuccessAction>(
          _onFetchSuccess,
        ),
        TypedReducer<ArticleListState, FetchArticlesFailedAction>(
          _onFetchFailed,
        ),

        TypedReducer<ArticleListState, LoadMoreArticlesAction>(_onLoadMore),
        TypedReducer<ArticleListState, LoadMoreArticlesSuccessAction>(
          _onLoadMoreSuccess,
        ),
        TypedReducer<ArticleListState, LoadMoreArticlesFailedAction>(
          _onLoadMoreFailed,
        ),

        TypedReducer<ArticleListState, RefreshArticlesAction>(_onRefresh),
      ]);

  static ArticleListState _onFetch(
    ArticleListState state,
    FetchArticlesAction action,
  ) {
    return state.copyWith(isLoading: true, isLoadingMore: false);
  }

  static ArticleListState _onFetchSuccess(
    ArticleListState state,
    FetchArticlesSuccessAction action,
  ) {
    return state.copyWith(
      isLoading: false,
      articles: action.articles,
      hasMore: action.hasMore,
    );
  }

  static ArticleListState _onFetchFailed(
    ArticleListState state,
    FetchArticlesFailedAction action,
  ) {
    return state.copyWith(isLoading: false);
  }

  static ArticleListState _onLoadMore(
    ArticleListState state,
    LoadMoreArticlesAction action,
  ) {
    return state.copyWith(isLoadingMore: true);
  }

  static ArticleListState _onLoadMoreSuccess(
    ArticleListState state,
    LoadMoreArticlesSuccessAction action,
  ) {
    return state.copyWith(
      isLoadingMore: false,
      articles: [...state.articles, ...action.articles],
      hasMore: action.hasMore,
    );
  }

  static ArticleListState _onLoadMoreFailed(
    ArticleListState state,
    LoadMoreArticlesFailedAction action,
  ) {
    return state.copyWith(isLoadingMore: false);
  }

  static ArticleListState _onRefresh(
    ArticleListState state,
    RefreshArticlesAction action,
  ) {
    return state.copyWith(isLoading: true, articles: [], hasMore: true);
  }
}
