import 'package:flutter/foundation.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/02_provider/provider.dart';

class ArticleListProvider extends ChangeNotifier {
  ArticleListState _state = const ArticleListState();
  final ArticleRepository _articleRepository;
  int _page = 1;

  ArticleListProvider(this._articleRepository);

  ArticleListState get state => _state;

  Future<void> setState(ArticleListState newState) async {
    _state = newState;
    notifyListeners();
  }

  Future<void> onInitialFetch() async {
    setState(_state.copyWith(isLoading: true, error: null));

    try {
      final response = await _articleRepository.getArticles(_page, 20);
      setState(
        _state.copyWith(
          isLoading: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: response.articles ?? [],
        ),
      );
    } catch (e) {
      setState(_state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> onLoadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    setState(_state.copyWith(isLoadingMore: true, error: null));

    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      setState(
        _state.copyWith(
          isLoadingMore: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: [...state.articles, ...response.articles ?? []],
        ),
      );
    } catch (e) {
      setState(_state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
