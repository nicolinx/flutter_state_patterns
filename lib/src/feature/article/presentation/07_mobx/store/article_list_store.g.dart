// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleListStore on _ArticleListStore, Store {
  late final _$stateAtom = Atom(
    name: '_ArticleListStore.state',
    context: context,
  );

  @override
  ArticleListState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ArticleListState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$onInitialFetchAsyncAction = AsyncAction(
    '_ArticleListStore.onInitialFetch',
    context: context,
  );

  @override
  Future<void> onInitialFetch() {
    return _$onInitialFetchAsyncAction.run(() => super.onInitialFetch());
  }

  late final _$onLoadMoreAsyncAction = AsyncAction(
    '_ArticleListStore.onLoadMore',
    context: context,
  );

  @override
  Future<void> onLoadMore() {
    return _$onLoadMoreAsyncAction.run(() => super.onLoadMore());
  }

  late final _$onRefreshAsyncAction = AsyncAction(
    '_ArticleListStore.onRefresh',
    context: context,
  );

  @override
  Future<void> onRefresh() {
    return _$onRefreshAsyncAction.run(() => super.onRefresh());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
