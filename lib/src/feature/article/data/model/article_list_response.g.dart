// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleListResponse _$ArticleListResponseFromJson(Map<String, dynamic> json) =>
    _ArticleListResponse(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      hasMore: json['hasMore'] as bool?,
    );

Map<String, dynamic> _$ArticleListResponseToJson(
  _ArticleListResponse instance,
) => <String, dynamic>{
  'articles': instance.articles,
  'page': instance.page,
  'limit': instance.limit,
  'hasMore': instance.hasMore,
};
