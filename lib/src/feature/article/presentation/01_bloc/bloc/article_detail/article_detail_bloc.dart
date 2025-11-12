import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_event.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_state.dart';

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
