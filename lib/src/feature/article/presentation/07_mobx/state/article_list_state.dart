import 'package:flutter_state_patterns/src/feature/article/data/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_list_state.freezed.dart';

@freezed
abstract class ArticleListState with _$ArticleListState {
  const factory ArticleListState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default([]) List<Article> articles,
    @Default(true) bool hasMore,
    String? error,
  }) = _ArticleListState;
}
