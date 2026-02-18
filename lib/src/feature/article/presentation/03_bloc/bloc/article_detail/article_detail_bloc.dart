import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/03_bloc/bloc.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  final ArticleRepository _articleRepository;

  ArticleDetailBloc(this._articleRepository)
    : super(const ArticleDetailState.initial()) {
    on<ArticleDetailEvent>((event, emit) async {
      await event.when(fetchArticleById: (id) => _onFetchArticleById(emit, id));
    });
  }

  Future<void> _onFetchArticleById(Emitter<ArticleDetailState> emit, id) async {
    emit(const ArticleDetailState.loading());
    try {
      final article = await _articleRepository.getArticlesById(id);
      emit(ArticleDetailState.loaded(article));
    } catch (e) {
      emit(ArticleDetailState.error(e.toString()));
    }
  }
}
