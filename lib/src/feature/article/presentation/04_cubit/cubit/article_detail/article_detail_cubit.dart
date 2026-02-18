import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_patterns/src/feature/article/data/repository/article_repository.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/04_cubit/cubit.dart';

class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  final ArticleRepository _articleRepository;

  ArticleDetailCubit(this._articleRepository)
    : super(const ArticleDetailState.initial());

  Future<void> onFetchArticleById(id) async {
    emit(const ArticleDetailState.loading());
    try {
      final article = await _articleRepository.getArticlesById(id);
      emit(ArticleDetailState.loaded(article));
    } catch (e) {
      emit(ArticleDetailState.error(e.toString()));
    }
  }
}
