import 'package:flutter_state_boilerplate/src/core/network/api_client.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/service/article_service.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // --- Core / Network ---
  di.registerLazySingleton(() => ApiClient());

  // --- Feature: Article ---
  di.registerLazySingleton(() => ArticleService(di<ApiClient>()));
  di.registerLazySingleton(() => ArticleRepository(di<ArticleService>()));
}
