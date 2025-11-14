import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/02_provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/setstate.dart'
    as setstate;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/02_provider/provider.dart'
    as provider;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/03_bloc/bloc.dart'
    as bloc;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/04_cubit/cubit.dart'
    as cubit;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/05_getx/getx.dart'
    as getx;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/06_riverpod/riverpod.dart'
    as riverpod;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart'
    as mobx;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/08_redux/redux.dart'
    as redux;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/09_valuenotifier/valuenotifier.dart'
    as valuenotifier;

class AppRouter {
  static GoRouter router = GoRouter(
    // initialLocation: bloc.ArticleListPage.routePath,
    // initialLocation: cubit.ArticleListPage.routePath,
    // initialLocation: setstate.ArticleListPage.routePath,
    // initialLocation: provider.ArticleListPage.routePath,
    // initialLocation: getx.ArticleListPage.routePath,
    // initialLocation: valuenotifier.ArticleListPage.routePath,
    // initialLocation: riverpod.ArticleListPage.routePath,
    // initialLocation: mobx.ArticleListPage.routePath,
    initialLocation: redux.ArticleListPage.routePath,
    routes: [
      // --- 01_setstate ---
      GoRoute(
        name: setstate.ArticleListPage.routeName,
        path: setstate.ArticleListPage.routePath,
        builder: (context, state) => setstate.ArticleListPage(),
      ),
      GoRoute(
        name: setstate.ArticleDetailPage.routeName,
        path: setstate.ArticleDetailPage.routePath,
        builder: (context, state) {
          final articleId = int.parse(state.pathParameters['id'].toString());
          return setstate.ArticleDetailPage(articleId: articleId);
        },
      ),
      // --- 02_provider ---
      GoRoute(
        name: provider.ArticleListPage.routeName,
        path: provider.ArticleListPage.routePath,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => di<ArticleListProvider>(),
          child: provider.ArticleListPage(),
        ),
      ),
      GoRoute(
        name: provider.ArticleDetailPage.routeName,
        path: provider.ArticleDetailPage.routePath,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => di<ArticleDetailProvider>(),
          child: provider.ArticleDetailPage(
            articleId: int.parse(state.pathParameters['id'].toString()),
          ),
        ),
      ),
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
      // --- 05_getx ---
      GoRoute(
        name: getx.ArticleListPage.routeName,
        path: getx.ArticleListPage.routePath,
        builder: (context, state) {
          getx.ArticleListBinding().dependencies();
          return getx.ArticleListPage();
        },
      ),
      GoRoute(
        name: getx.ArticleDetailPage.routeName,
        path: getx.ArticleDetailPage.routePath,
        builder: (context, state) {
          getx.ArticleDetailBinding().dependencies();
          return getx.ArticleDetailPage(
            articleId: int.parse(state.pathParameters['id'].toString()),
          );
        },
      ),
      // --- 06_riverpod ---
      GoRoute(
        name: riverpod.ArticleListPage.routeName,
        path: riverpod.ArticleListPage.routePath,
        builder: (context, state) {
          return riverpod.ArticleListPage();
        },
      ),
      GoRoute(
        name: riverpod.ArticleDetailPage.routeName,
        path: riverpod.ArticleDetailPage.routePath,
        builder: (context, state) {
          return riverpod.ArticleDetailPage(
            articleId: int.parse(state.pathParameters['id'].toString()),
          );
        },
      ),
      // --- 07_mobx ---
      GoRoute(
        name: mobx.ArticleListPage.routeName,
        path: mobx.ArticleListPage.routePath,
        builder: (context, state) {
          return mobx.ArticleListPage();
        },
      ),
      GoRoute(
        name: mobx.ArticleDetailPage.routeName,
        path: mobx.ArticleDetailPage.routePath,
        builder: (context, state) {
          return mobx.ArticleDetailPage(
            articleId: int.parse(state.pathParameters['id'].toString()),
          );
        },
      ),
      // --- 08_redux ---
      GoRoute(
        name: redux.ArticleListPage.routeName,
        path: redux.ArticleListPage.routePath,
        builder: (context, state) {
          return redux.ArticleListPage();
        },
      ),
      // --- 09_valuenotifier ---
      GoRoute(
        name: valuenotifier.ArticleListPage.routeName,
        path: valuenotifier.ArticleListPage.routePath,
        builder: (context, state) {
          return valuenotifier.ArticleListPage();
        },
      ),
      GoRoute(
        name: valuenotifier.ArticleDetailPage.routeName,
        path: valuenotifier.ArticleDetailPage.routePath,
        builder: (context, state) {
          return valuenotifier.ArticleDetailPage(
            articleId: int.parse(state.pathParameters['id'].toString()),
          );
        },
      ),
    ],
  );
}
