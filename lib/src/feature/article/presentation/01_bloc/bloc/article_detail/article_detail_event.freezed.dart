// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArticleDetailEvent {

 int get id;
/// Create a copy of ArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleDetailEventCopyWith<ArticleDetailEvent> get copyWith => _$ArticleDetailEventCopyWithImpl<ArticleDetailEvent>(this as ArticleDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleDetailEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ArticleDetailEvent(id: $id)';
}


}

/// @nodoc
abstract mixin class $ArticleDetailEventCopyWith<$Res>  {
  factory $ArticleDetailEventCopyWith(ArticleDetailEvent value, $Res Function(ArticleDetailEvent) _then) = _$ArticleDetailEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$ArticleDetailEventCopyWithImpl<$Res>
    implements $ArticleDetailEventCopyWith<$Res> {
  _$ArticleDetailEventCopyWithImpl(this._self, this._then);

  final ArticleDetailEvent _self;
  final $Res Function(ArticleDetailEvent) _then;

/// Create a copy of ArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleDetailEvent].
extension ArticleDetailEventPatterns on ArticleDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchArticleById value)?  fetchArticleById,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchArticleById() when fetchArticleById != null:
return fetchArticleById(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchArticleById value)  fetchArticleById,}){
final _that = this;
switch (_that) {
case _FetchArticleById():
return fetchArticleById(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchArticleById value)?  fetchArticleById,}){
final _that = this;
switch (_that) {
case _FetchArticleById() when fetchArticleById != null:
return fetchArticleById(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id)?  fetchArticleById,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchArticleById() when fetchArticleById != null:
return fetchArticleById(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id)  fetchArticleById,}) {final _that = this;
switch (_that) {
case _FetchArticleById():
return fetchArticleById(_that.id);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id)?  fetchArticleById,}) {final _that = this;
switch (_that) {
case _FetchArticleById() when fetchArticleById != null:
return fetchArticleById(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _FetchArticleById implements ArticleDetailEvent {
  const _FetchArticleById(this.id);
  

@override final  int id;

/// Create a copy of ArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchArticleByIdCopyWith<_FetchArticleById> get copyWith => __$FetchArticleByIdCopyWithImpl<_FetchArticleById>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchArticleById&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ArticleDetailEvent.fetchArticleById(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FetchArticleByIdCopyWith<$Res> implements $ArticleDetailEventCopyWith<$Res> {
  factory _$FetchArticleByIdCopyWith(_FetchArticleById value, $Res Function(_FetchArticleById) _then) = __$FetchArticleByIdCopyWithImpl;
@override @useResult
$Res call({
 int id
});




}
/// @nodoc
class __$FetchArticleByIdCopyWithImpl<$Res>
    implements _$FetchArticleByIdCopyWith<$Res> {
  __$FetchArticleByIdCopyWithImpl(this._self, this._then);

  final _FetchArticleById _self;
  final $Res Function(_FetchArticleById) _then;

/// Create a copy of ArticleDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FetchArticleById(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
