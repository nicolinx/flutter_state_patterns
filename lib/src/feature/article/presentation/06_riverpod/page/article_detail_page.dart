import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/06_riverpod/riverpod.dart';

class ArticleDetailPage extends ConsumerStatefulWidget {
  static const String routeName = '/riverpod/article-detail';
  static const String routePath = '/riverpod/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  ConsumerState<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends ConsumerState<ArticleDetailPage> {
  late final ArticleDetailController _controller;

  @override
  void initState() {
    _controller = ref.read(articleDetailProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.onFetchArticleById(widget.articleId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riverpod: Article Detail Page')),
      body: Builder(
        builder: (context) {
          final state = ref.watch(articleDetailProvider);
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
