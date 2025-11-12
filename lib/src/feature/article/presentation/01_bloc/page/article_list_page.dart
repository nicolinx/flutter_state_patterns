import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_list/article_list_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_list/article_list_event.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_list/article_list_state.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/page/article_detail_page.dart';
import 'package:go_router/go_router.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/article-list';
  static const String routePath = '/article-list';

  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final ArticleListBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<ArticleListBloc>();
    _bloc.add(const ArticleListEvent.initialFetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article List Page')),
      body: BlocBuilder<ArticleListBloc, ArticleListState>(
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
                _bloc.add(const ArticleListEvent.loadMore());
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
