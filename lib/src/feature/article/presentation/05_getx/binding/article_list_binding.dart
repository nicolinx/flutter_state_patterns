import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/05_getx/getx.dart';
import 'package:get/get.dart';

class ArticleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleListController(di<ArticleRepository>()));
  }
}
