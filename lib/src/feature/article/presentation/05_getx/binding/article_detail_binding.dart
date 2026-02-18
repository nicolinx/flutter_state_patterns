import 'package:flutter_state_patterns/src/core/di/injector.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/05_getx/getx.dart';
import 'package:get/get.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailController(di<ArticleRepository>()));
  }
}
