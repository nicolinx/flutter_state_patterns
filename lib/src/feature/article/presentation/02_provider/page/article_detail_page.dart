import 'package:flutter/material.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/02_provider/provider.dart';
import 'package:provider/provider.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/provider/article-detail';
  static const String routePath = '/provider/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailProvider _provider;

  @override
  void initState() {
    _provider = context.read<ArticleDetailProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.onFetchArticleById(widget.articleId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ArticleDetailProvider>().state;

    return Scaffold(
      appBar: AppBar(title: Text('Provider: Article Detail Page')),
      body: Builder(
        builder: (context) {
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
