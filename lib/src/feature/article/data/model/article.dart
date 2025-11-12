import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
sealed class Article with _$Article {
  factory Article({int? id, String? title, String? image}) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
