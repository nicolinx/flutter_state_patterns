import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/03_bloc/bloc.dart'
    as bloc;
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: bloc.ArticleListPage.routePath,
    routes: [
      GoRoute(
        name: bloc.ArticleListPage.routeName,
        path: bloc.ArticleListPage.routePath,
        builder: (context, state) => BlocProvider(
          create: (_) => di<bloc.ArticleListBloc>(),
          child: bloc.ArticleListPage(),
        ),
      ),
      GoRoute(
        name: bloc.ArticleDetailPage.routeName,
        path: bloc.ArticleDetailPage.routePath,
        builder: (context, state) {
          final articleId = int.parse(state.pathParameters['id'].toString());
          return BlocProvider(
            create: (_) => di<bloc.ArticleDetailBloc>(),
            child: bloc.ArticleDetailPage(articleId: articleId),
          );
        },
      ),
    ],
  );
}
