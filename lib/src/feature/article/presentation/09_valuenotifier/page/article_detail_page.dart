import 'package:flutter/material.dart';
import 'package:flutter_state_patterns/src/core/di/injector.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/09_valuenotifier/valuenotifier.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/valuenotifier/article-detail';
  static const String routePath = '/valuenotifier/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailController _controller;

  @override
  void initState() {
    _controller = di<ArticleDetailController>();
    _controller.onFetchArticleById(widget.articleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Valuenotifier: Article Detail Page')),
      body: ValueListenableBuilder(
        valueListenable: _controller.state,
        builder: (context, state, _) {
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
