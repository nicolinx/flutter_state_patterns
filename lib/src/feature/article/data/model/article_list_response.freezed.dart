// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleListResponse {

 List<Article>? get articles; int? get page; int? get limit; bool? get hasMore;
/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleListResponseCopyWith<ArticleListResponse> get copyWith => _$ArticleListResponseCopyWithImpl<ArticleListResponse>(this as ArticleListResponse, _$identity);

  /// Serializes this ArticleListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleListResponse&&const DeepCollectionEquality().equals(other.articles, articles)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(articles),page,limit,hasMore);

@override
String toString() {
  return 'ArticleListResponse(articles: $articles, page: $page, limit: $limit, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $ArticleListResponseCopyWith<$Res>  {
  factory $ArticleListResponseCopyWith(ArticleListResponse value, $Res Function(ArticleListResponse) _then) = _$ArticleListResponseCopyWithImpl;
@useResult
$Res call({
 List<Article>? articles, int? page, int? limit, bool? hasMore
});




}
/// @nodoc
class _$ArticleListResponseCopyWithImpl<$Res>
    implements $ArticleListResponseCopyWith<$Res> {
  _$ArticleListResponseCopyWithImpl(this._self, this._then);

  final ArticleListResponse _self;
  final $Res Function(ArticleListResponse) _then;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? articles = freezed,Object? page = freezed,Object? limit = freezed,Object? hasMore = freezed,}) {
  return _then(_self.copyWith(
articles: freezed == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<Article>?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,hasMore: freezed == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleListResponse].
extension ArticleListResponsePatterns on ArticleListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ArticleListResponse():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Article>? articles,  int? page,  int? limit,  bool? hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that.articles,_that.page,_that.limit,_that.hasMore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Article>? articles,  int? page,  int? limit,  bool? hasMore)  $default,) {final _that = this;
switch (_that) {
case _ArticleListResponse():
return $default(_that.articles,_that.page,_that.limit,_that.hasMore);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Article>? articles,  int? page,  int? limit,  bool? hasMore)?  $default,) {final _that = this;
switch (_that) {
case _ArticleListResponse() when $default != null:
return $default(_that.articles,_that.page,_that.limit,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleListResponse implements ArticleListResponse {
   _ArticleListResponse({final  List<Article>? articles, this.page, this.limit, this.hasMore}): _articles = articles;
  factory _ArticleListResponse.fromJson(Map<String, dynamic> json) => _$ArticleListResponseFromJson(json);

 final  List<Article>? _articles;
@override List<Article>? get articles {
  final value = _articles;
  if (value == null) return null;
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? page;
@override final  int? limit;
@override final  bool? hasMore;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleListResponseCopyWith<_ArticleListResponse> get copyWith => __$ArticleListResponseCopyWithImpl<_ArticleListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleListResponse&&const DeepCollectionEquality().equals(other._articles, _articles)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_articles),page,limit,hasMore);

@override
String toString() {
  return 'ArticleListResponse(articles: $articles, page: $page, limit: $limit, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$ArticleListResponseCopyWith<$Res> implements $ArticleListResponseCopyWith<$Res> {
  factory _$ArticleListResponseCopyWith(_ArticleListResponse value, $Res Function(_ArticleListResponse) _then) = __$ArticleListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Article>? articles, int? page, int? limit, bool? hasMore
});




}
/// @nodoc
class __$ArticleListResponseCopyWithImpl<$Res>
    implements _$ArticleListResponseCopyWith<$Res> {
  __$ArticleListResponseCopyWithImpl(this._self, this._then);

  final _ArticleListResponse _self;
  final $Res Function(_ArticleListResponse) _then;

/// Create a copy of ArticleListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? articles = freezed,Object? page = freezed,Object? limit = freezed,Object? hasMore = freezed,}) {
  return _then(_ArticleListResponse(
articles: freezed == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<Article>?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,hasMore: freezed == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
