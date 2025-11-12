import 'package:flutter_state_boilerplate/src/core/network/api_client.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/service/article_service.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_list/article_list_bloc.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // --- Core / Network ---
  di.registerLazySingleton(() => ApiClient());

  // --- Feature: Article ---
  di.registerLazySingleton(() => ArticleService(di<ApiClient>()));
  di.registerLazySingleton(() => ArticleRepository(di<ArticleService>()));
  di.registerFactory(() => ArticleListBloc(di<ArticleRepository>()));
  di.registerFactory(() => ArticleDetailBloc(di<ArticleRepository>()));
}
