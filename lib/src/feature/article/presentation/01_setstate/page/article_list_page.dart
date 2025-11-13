import 'package:flutter/material.dart';
import 'package:flutter_state_boilerplate/src/core/di/injector.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/controller/article_list_controller.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_setstate/state/article_list_state.dart';
import 'package:go_router/go_router.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/setstate/article-list';
  static const String routePath = '/setstate/article-list';

  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListController _controller;
  ArticleListState state = const ArticleListState();

  @override
  void initState() {
    _controller = di<ArticleListController>();
    _controller.setListener((newState) {
      setState(() {});
    });
    _controller.onInitialFetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc: Article List Page')),
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
                _controller.onLoadMore();
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
