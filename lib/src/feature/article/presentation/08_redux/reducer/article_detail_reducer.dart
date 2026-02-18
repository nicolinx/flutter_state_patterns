import 'package:redux/redux.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';

class ArticleDetailReducer {
  static final Reducer<ArticleDetailState> reducer =
      combineReducers<ArticleDetailState>([
        TypedReducer<ArticleDetailState, FetchArticleDetailAction>(_onFetch),
        TypedReducer<ArticleDetailState, FetchArticleDetailSuccessAction>(
          _onFetchSuccess,
        ),
        TypedReducer<ArticleDetailState, FetchArticleDetailFailedAction>(
          _onFetchFailed,
        ),
      ]);

  static ArticleDetailState _onFetch(
    ArticleDetailState state,
    FetchArticleDetailAction action,
  ) {
    return ArticleDetailState.loading();
  }

  static ArticleDetailState _onFetchSuccess(
    ArticleDetailState state,
    FetchArticleDetailSuccessAction action,
  ) {
    return ArticleDetailState.loaded(action.article);
  }

  static ArticleDetailState _onFetchFailed(
    ArticleDetailState state,
    FetchArticleDetailFailedAction action,
  ) {
    return ArticleDetailState.error(action.error);
  }
}
