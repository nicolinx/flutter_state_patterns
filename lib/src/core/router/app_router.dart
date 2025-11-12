import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_list/article_list_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/page/article_detail_page.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/page/article_list_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: ArticleListPage.routePath,
    routes: [
      GoRoute(
        name: ArticleListPage.routeName,
        path: ArticleListPage.routePath,
        builder: (context, state) => BlocProvider(
          create: (_) => di<ArticleListBloc>(),
          child: ArticleListPage(),
        ),
      ),
      GoRoute(
        name: ArticleDetailPage.routeName,
        path: ArticleDetailPage.routePath,
        builder: (context, state) {
          final articleId = int.parse(state.pathParameters['id'].toString());
          return BlocProvider(
            create: (_) => di<ArticleDetailBloc>(),
            child: ArticleDetailPage(articleId: articleId),
          );
        },
      ),
    ],
  );
}
