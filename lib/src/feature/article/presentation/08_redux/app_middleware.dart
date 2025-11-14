import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddlewares() {
  final repo = di<ArticleRepository>();

  // just return your feature middleware list
  return createArticleListMiddleware(repo);
}
