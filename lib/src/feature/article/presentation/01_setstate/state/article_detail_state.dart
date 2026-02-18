import 'package:flutter_state_patterns/src/feature/article/data/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_detail_state.freezed.dart';

@freezed
class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState.initial() = _Initial;
  const factory ArticleDetailState.loading() = _Loading;
  const factory ArticleDetailState.loaded(Article article) = _Loaded;
  const factory ArticleDetailState.error(String error) = _Error;
}
