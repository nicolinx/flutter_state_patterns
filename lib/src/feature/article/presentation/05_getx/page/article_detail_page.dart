import 'package:flutter/material.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/05_getx/getx.dart';
import 'package:get/get.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/getx/article-detail';
  static const String routePath = '/getx/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailController _controller;

  @override
  void initState() {
    _controller = Get.find<ArticleDetailController>();
    _controller.onFetchArticleById(widget.articleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX: Article Detail Page')),
      body: Obx(() {
        final state = _controller.state.value;
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
      }),
    );
  }
}
