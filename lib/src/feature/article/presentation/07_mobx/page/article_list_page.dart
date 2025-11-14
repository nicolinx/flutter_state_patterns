import 'package:flutter/material.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/07_mobx/mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/mobx/article-list';
  static const String routePath = '/mobx/article-list';

  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListStore _store;

  @override
  void initState() {
    super.initState();

    _store = di<ArticleListStore>();
    _store.onInitialFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MobX: Article List Page')),
      body: Observer(
        builder: (context) {
          final state = _store.state;

          if (state.isLoading && state.articles.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          if (state.error != null && state.articles.isEmpty) {
            return Center(child: Text(state.error!));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 200.0) {
                _store.onLoadMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: state.articles.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.articles.length) {
                  return ListTile(
                    // onTap: () => context.pushNamed(
                    //   ArticleDetailPage.routeName,
                    //   pathParameters: {
                    //     'id': state.articles[index].id.toString(),
                    //   },
                    // ),
                    title: Text(state.articles[index].title ?? '-'),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
