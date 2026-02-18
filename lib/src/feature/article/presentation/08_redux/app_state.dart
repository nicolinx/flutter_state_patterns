import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required ArticleListState articleListState,
    required ArticleDetailState articleDetailState, // 👈 add this
  }) = _AppState;

  factory AppState.initial() => AppState(
    articleListState: const ArticleListState(),
    articleDetailState: const ArticleDetailState.initial(), // 👈 add this
  );
}
