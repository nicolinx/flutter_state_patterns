import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/state/article_list_state.dart';

class ArticleListController {
  ArticleListState state = const ArticleListState();
  final ArticleRepository _articleRepository;
  void Function(ArticleListState)? _listener;
  int _page = 1;

  ArticleListController(this._articleRepository);

  void setListener(void Function(ArticleListState) listener) {
    _listener = listener;
  }

  void setState(ArticleListState newState) {
    state = newState;
    _listener?.call(newState);
  }

  Future<void> onInitialFetch() async {
    setState(state.copyWith(isLoading: true, error: null));
    try {
      final response = await _articleRepository.getArticles(_page, 20);
      setState(
        state.copyWith(
          isLoading: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: response.articles ?? [],
        ),
      );
    } catch (e) {
      setState(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> onLoadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    setState(state.copyWith(isLoadingMore: true, error: null));
    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      setState(
        state.copyWith(
          isLoadingMore: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: [...state.articles, ...response.articles ?? []],
        ),
      );
    } catch (e) {
      setState(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
