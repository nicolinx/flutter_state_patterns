import 'package:flutter_state_patterns/src/feature/article/data/model/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_list_response.freezed.dart';
part 'article_list_response.g.dart';

@freezed
sealed class ArticleListResponse with _$ArticleListResponse {
  factory ArticleListResponse({
    List<Article>? articles,
    int? page,
    int? limit,
    bool? hasMore,
  }) = _ArticleListResponse;

  factory ArticleListResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleListResponseFromJson(json);
}
