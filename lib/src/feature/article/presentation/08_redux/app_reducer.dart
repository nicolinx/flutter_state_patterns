import 'package:flutter_state_boilerplate/src/feature/article/presentation/08_redux/redux.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    articleListState: articleListReducer(state.articleListState, action),
    // articleDetailState: articleDetailReducer(state.articleDetailState, action),
  );
}
