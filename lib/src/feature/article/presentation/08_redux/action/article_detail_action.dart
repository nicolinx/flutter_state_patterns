import 'package:flutter_state_patterns/src/feature/article/data/model/article.dart';

// INITIAL FETCH / DETAIL
class FetchArticleDetailAction {
  final int articleId;
  FetchArticleDetailAction(this.articleId);
}

class FetchArticleDetailSuccessAction {
  final Article article;
  FetchArticleDetailSuccessAction(this.article);
}

class FetchArticleDetailFailedAction {
  final String error;
  FetchArticleDetailFailedAction(this.error);
}
