import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/04_cubit/cubit.dart';

class ArticleListCubit extends Cubit<ArticleListState> {
  final ArticleRepository _articleRepository;
  int _page = 1;

  ArticleListCubit(this._articleRepository) : super(const ArticleListState());

  Future<void> onInitialFetch() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final response = await _articleRepository.getArticles(_page, 20);
      emit(
        state.copyWith(
          isLoading: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: response.articles ?? [],
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> onLoadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true, error: null));
    try {
      final response = await _articleRepository.getArticles(++_page, 20);
      emit(
        state.copyWith(
          isLoadingMore: false,
          error: null,
          hasMore: response.hasMore ?? false,
          articles: [...state.articles, ...response.articles ?? []],
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  Future<void> onRefresh() async {
    _page = 1;
    onInitialFetch();
  }
}
