import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_patterns/src/feature/article/presentation/04_cubit/cubit.dart';

class ArticleDetailPage extends StatefulWidget {
  static const String routeName = '/cubit/article-detail';
  static const String routePath = '/cubit/article-detail/:id';

  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late final ArticleDetailCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ArticleDetailCubit>();
    _cubit.onFetchArticleById(widget.articleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cubit: Article Detail Page')),
      body: BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
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
