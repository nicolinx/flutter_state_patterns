import 'package:flutter_state_patterns/src/core/di/injector.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddlewares() {
  // just return your feature middleware list
  return [
    ...di<ArticleListMiddleware>().middlewares,
    ...di<ArticleDetailMiddleware>().middlewares,
  ];
}
