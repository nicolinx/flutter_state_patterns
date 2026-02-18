import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    articleListState: ArticleListReducer.reducer(
      state.articleListState,
      action,
    ),
    articleDetailState: ArticleDetailReducer.reducer(
      state.articleDetailState,
      action,
    ),
  );
}
