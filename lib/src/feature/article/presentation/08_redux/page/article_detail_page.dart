import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/08_redux/redux.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/redux/article-detail';
  static const String routePath = '/redux/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.of<AppState>(
        context,
      ).dispatch(FetchArticleDetailAction(widget.articleId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Redux: Article Detail Page')),
      body: StoreConnector<AppState, ArticleDetailState>(
        converter: (store) => store.state.articleDetailState,
        builder: (context, state) {
          return state.when(
            initial: () => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            loaded: (data) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.title ?? '-',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.network(data.image ?? ''),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
