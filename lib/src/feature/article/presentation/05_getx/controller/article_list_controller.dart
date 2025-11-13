import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/05_getx/getx.dart';
import 'package:get/get.dart';

class ArticleListController extends GetxController {
  final ArticleRepository _articleRepository;
  final state = ArticleListState().obs;
  int _page = 1;

  ArticleListController(this._articleRepository);

  Future<void> onInitialFetch() async {
    state.value = state.value.copyWith(isLoading: true, error: null);

    try {
      final response = await _articleRepository.getArticles(_page, 20);
      state.value = state.value.copyWith(
        isLoading: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: response.articles ?? [],
      );
    } catch (e) {
      state.value = state.value.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> onLoadMore() async {
    if (state.value.isLoadingMore || !state.value.hasMore) return;

    state.value = state.value.copyWith(isLoadingMore: true, error: null);

    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      state.value = state.value.copyWith(
        isLoadingMore: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: [...state.value.articles, ...response.articles ?? []],
      );
    } catch (e) {
      state.value = state.value.copyWith(
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
