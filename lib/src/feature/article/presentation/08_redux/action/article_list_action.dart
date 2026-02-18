// INITIAL FETCH
import 'package:flutter_state_patterns/src/feature/article/data/model/article.dart';

class FetchArticlesAction {}

class FetchArticlesSuccessAction {
  final List<Article> articles;
  final bool hasMore;
  FetchArticlesSuccessAction(this.articles, this.hasMore);
}

class FetchArticlesFailedAction {
  final String error;
  FetchArticlesFailedAction(this.error);
}

// LOAD MORE
class LoadMoreArticlesAction {}

class LoadMoreArticlesSuccessAction {
  final List<Article> articles;
  final bool hasMore;
  LoadMoreArticlesSuccessAction(this.articles, this.hasMore);
}

class LoadMoreArticlesFailedAction {
  final String error;
  LoadMoreArticlesFailedAction(this.error);
}

// REFRESH
class RefreshArticlesAction {}
