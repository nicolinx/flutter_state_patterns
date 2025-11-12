// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Article _$ArticleFromJson(Map<String, dynamic> json) => _Article(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$ArticleToJson(_Article instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
};
