import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_detail_event.freezed.dart';

@freezed
abstract class ArticleDetailEvent with _$ArticleDetailEvent {
  const factory ArticleDetailEvent.fetchArticleById(int id) = _FetchArticleById;
}
