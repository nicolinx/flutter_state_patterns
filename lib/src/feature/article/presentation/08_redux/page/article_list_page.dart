import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';
import 'package:go_router/go_router.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/redux/article-list';
  static const String routePath = '/redux/article-list';

  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.of<AppState>(context).dispatch(FetchArticlesAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux: Article List Page')),
      body: StoreConnector<AppState, ArticleListState>(
        converter: (store) => store.state.articleListState,
        builder: (context, state) {
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
                StoreProvider.of<AppState>(
                  context,
                ).dispatch(LoadMoreArticlesAction());
              }
              return false;
            },
            child: ListView.builder(
              itemCount: state.articles.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.articles.length) {
                  return ListTile(
                    onTap: () => context.pushNamed(
                      ArticleDetailPage.routeName,
                      pathParameters: {
                        'id': state.articles[index].id.toString(),
                      },
                    ),
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
