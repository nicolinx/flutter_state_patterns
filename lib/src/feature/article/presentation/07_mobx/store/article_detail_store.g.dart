// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleDetailStore on _ArticleDetailStore, Store {
  late final _$stateAtom = Atom(
    name: '_ArticleDetailStore.state',
    context: context,
  );

  @override
  ArticleDetailState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ArticleDetailState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$onFetchArticleByIdAsyncAction = AsyncAction(
    '_ArticleDetailStore.onFetchArticleById',
    context: context,
  );

  @override
  Future<void> onFetchArticleById(dynamic id) {
    return _$onFetchArticleByIdAsyncAction.run(
      () => super.onFetchArticleById(id),
    );
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
