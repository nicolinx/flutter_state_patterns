import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_bloc.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_event.dart';
import 'package:flutter_state_boilerplate/src/feature/article/presentation/01_bloc/bloc/article_detail/article_detail_state.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/article-detail';
  static const String routePath = '/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<ArticleDetailBloc>();
    _bloc.add(ArticleDetailEvent.fetchArticleById(widget.articleId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Article Detail Page')),
      body: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
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
