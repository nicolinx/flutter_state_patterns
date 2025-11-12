import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/BLoC/bloc/article_list/article_list_event.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/BLoC/bloc/article_list/article_list_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final ArticleRepository _articleRepository;
  int _page = 1;

  ArticleListBloc(this._articleRepository) : super(const ArticleListState()) {
    on<FetchArticles>(_onFetchArticles);
    on<LoadMore>(_onLoadMore);
    on<Refresh>(_onRefresh);
  }

  Future<void> _onFetchArticles(
    FetchArticles event,
    Emitter<ArticleListState> emit,
  ) async {
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

  Future<void> _onLoadMore(
    LoadMore event,
    Emitter<ArticleListState> emit,
  ) async {
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

  Future<void> _onRefresh(Refresh event, Emitter<ArticleListState> emit) async {
    _page = 1;
    add(const FetchArticles());
  }
}
