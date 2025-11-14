import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/06_riverpod/riverpod.dart';

class ArticleListController extends StateNotifier<ArticleListState> {
  final ArticleRepository _articleRepository;
  int _page = 1;

  ArticleListController(this._articleRepository)
    : super(const ArticleListState());

  Future<void> onInitialFetch() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _articleRepository.getArticles(_page, 20);
      state = state.copyWith(
        isLoading: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: response.articles ?? [],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> onLoadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    state = state.copyWith(isLoadingMore: true, error: null);

    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      state = state.copyWith(
        isLoadingMore: false,
        error: null,
        hasMore: response.hasMore ?? false,
        articles: [...state.articles, ...response.articles ?? []],
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
