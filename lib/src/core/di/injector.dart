import 'package:get_it/get_it.dart';
import 'package:flutter_state_boilerplate/src/core/network/api_client.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/service/article_service.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/setstate.dart'
    as setstate;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/02_provider/provider.dart'
    as provider;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/03_bloc/bloc.dart'
    as bloc;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/04_cubit/cubit.dart'
    as cubit;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/06_riverpod/riverpod.dart'
    as riverpod;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart'
    as mobx;
import 'package:flutter_state_boilerplate/src/feature/article/presentation/09_valuenotifier/valuenotifier.dart'
    as valuenotifier;

final di = GetIt.instance;

Future<void> initDI() async {
  // --- Core / Network ---
  di.registerLazySingleton(() => ApiClient());

  // --- Feature: Article ---
  di.registerLazySingleton(() => ArticleService(di<ApiClient>()));
  di.registerLazySingleton(() => ArticleRepository(di<ArticleService>()));

  // --- 01_setstate ---
  di.registerFactory(
    () => setstate.ArticleListController(di<ArticleRepository>()),
  );
  di.registerFactory(
    () => setstate.ArticleDetailController(di<ArticleRepository>()),
  );

  // --- 02_provider ---
  di.registerFactory(
    () => provider.ArticleListProvider(di<ArticleRepository>()),
  );
  di.registerFactory(
    () => provider.ArticleDetailProvider(di<ArticleRepository>()),
  );

  // --- 03_bloc ---
  di.registerFactory(() => bloc.ArticleListBloc(di<ArticleRepository>()));
  di.registerFactory(() => bloc.ArticleDetailBloc(di<ArticleRepository>()));

  // --- 04_cubit ---
  di.registerFactory(() => cubit.ArticleListCubit(di<ArticleRepository>()));
  di.registerFactory(() => cubit.ArticleDetailCubit(di<ArticleRepository>()));

  // --- 06_riverpod ---
  di.registerFactory(
    () => riverpod.ArticleListController(di<ArticleRepository>()),
  );
  di.registerFactory(
    () => riverpod.ArticleDetailController(di<ArticleRepository>()),
  );

  // --- 07_mobx ---
  di.registerFactory(() => mobx.ArticleListStore(di<ArticleRepository>()));
  // di.registerFactory(
  //   () => riverpod.ArticleDetailController(di<ArticleRepository>()),
  // );

  // --- 09_valuenotifier ---
  di.registerFactory(
    () => valuenotifier.ArticleListController(di<ArticleRepository>()),
  );
  di.registerFactory(
    () => valuenotifier.ArticleDetailController(di<ArticleRepository>()),
  );
}
