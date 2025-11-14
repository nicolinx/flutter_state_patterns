import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart';
import 'package:mobx/mobx.dart';

part 'article_list_store.g.dart';

class ArticleListStore = _ArticleListStore with _$ArticleListStore;

abstract class _ArticleListStore with Store {
  final ArticleRepository _articleRepository;
  int _page = 1;

  _ArticleListStore(this._articleRepository);

  @observable
  ArticleListState state = const ArticleListState();

  @action
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

  @action
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

  @action
  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
