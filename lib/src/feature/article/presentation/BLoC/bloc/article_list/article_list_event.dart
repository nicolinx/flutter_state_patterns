import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_list_event.freezed.dart';

@freezed
class ArticleListEvent with _$ArticleListEvent {
  const factory ArticleListEvent.fetchArticles() = FetchArticles;
  const factory ArticleListEvent.loadMore() = LoadMore;
  const factory ArticleListEvent.refresh() = Refresh;
}
