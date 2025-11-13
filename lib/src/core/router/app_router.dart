import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/setstate.dart'
    as setstate;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/03_bloc/bloc.dart'
    as bloc;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/04_cubit/cubit.dart'
    as cubit;
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    // initialLocation: bloc.ArticleListPage.routePath,
    // initialLocation: cubit.ArticleListPage.routePath,
    initialLocation: setstate.ArticleListPage.routePath,
    routes: [
      // --- 01_setstate ---
      GoRoute(
        name: setstate.ArticleListPage.routeName,
        path: setstate.ArticleListPage.routePath,
        builder: (context, state) => setstate.ArticleListPage(),
      ),
      // GoRoute(
      //   name: bloc.ArticleDetailPage.routeName,
      //   path: bloc.ArticleDetailPage.routePath,
      //   builder: (context, state) {
      //     final articleId = int.parse(state.pathParameters['id'].toString());
      //     return BlocProvider(
      //       create: (_) => di<bloc.ArticleDetailBloc>(),
      //       child: bloc.ArticleDetailPage(articleId: articleId),
      //     );
      //   },
      // ),
      // --- 03_bloc ---
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
      // --- 04_cubit ---
      GoRoute(
        name: cubit.ArticleListPage.routeName,
        path: cubit.ArticleListPage.routePath,
        builder: (context, state) => BlocProvider(
          create: (_) => di<cubit.ArticleListCubit>(),
          child: cubit.ArticleListPage(),
        ),
      ),
      GoRoute(
        name: cubit.ArticleDetailPage.routeName,
        path: cubit.ArticleDetailPage.routePath,
        builder: (context, state) {
          final articleId = int.parse(state.pathParameters['id'].toString());
          return BlocProvider(
            create: (_) => di<cubit.ArticleDetailCubit>(),
            child: cubit.ArticleDetailPage(articleId: articleId),
          );
        },
      ),
    ],
  );
}
