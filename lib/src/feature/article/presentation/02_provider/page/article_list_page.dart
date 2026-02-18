import 'package:flutter/material.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/02_provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/provider/article-list';
  static const String routePath = '/provider/article-list';

  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListProvider _provider;

  @override
  void initState() {
    super.initState();

    _provider = context.read<ArticleListProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.onInitialFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ArticleListProvider>().state;

    return Scaffold(
      appBar: AppBar(title: Text('Provider: Article List Page')),
      body: Builder(
        builder: (context) {
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
                _provider.onLoadMore();
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
