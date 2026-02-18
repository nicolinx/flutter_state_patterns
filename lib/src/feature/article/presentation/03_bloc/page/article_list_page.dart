import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/03_bloc/bloc.dart';

class ArticleListPage extends StatefulWidget {
  static const String routeName = '/bloc/article-list';
  static const String routePath = '/bloc/article-list';

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
      appBar: AppBar(title: Text('Bloc: Article List Page')),
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
