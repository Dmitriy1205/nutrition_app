// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeCollection _$RecipeCollectionFromJson(Map<String, dynamic> json) {
  return _RecipeCollection.fromJson(json);
}

/// @nodoc
mixin _$RecipeCollection {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipe_id')
  String? get recipeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCollectionCopyWith<RecipeCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCollectionCopyWith<$Res> {
  factory $RecipeCollectionCopyWith(
          RecipeCollection value, $Res Function(RecipeCollection) then) =
      _$RecipeCollectionCopyWithImpl<$Res, RecipeCollection>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'recipe_id') String? recipeId});
}

/// @nodoc
class _$RecipeCollectionCopyWithImpl<$Res, $Val extends RecipeCollection>
    implements $RecipeCollectionCopyWith<$Res> {
  _$RecipeCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? recipeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCollectionCopyWith<$Res>
    implements $RecipeCollectionCopyWith<$Res> {
  factory _$$_RecipeCollectionCopyWith(
          _$_RecipeCollection value, $Res Function(_$_RecipeCollection) then) =
      __$$_RecipeCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'recipe_id') String? recipeId});
}

/// @nodoc
class __$$_RecipeCollectionCopyWithImpl<$Res>
    extends _$RecipeCollectionCopyWithImpl<$Res, _$_RecipeCollection>
    implements _$$_RecipeCollectionCopyWith<$Res> {
  __$$_RecipeCollectionCopyWithImpl(
      _$_RecipeCollection _value, $Res Function(_$_RecipeCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? recipeId = freezed,
  }) {
    return _then(_$_RecipeCollection(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeId: freezed == recipeId
          ? _value.recipeId
          : recipeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeCollection implements _RecipeCollection {
  const _$_RecipeCollection(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'recipe_id') this.recipeId});

  factory _$_RecipeCollection.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeCollectionFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'recipe_id')
  final String? recipeId;

  @override
  String toString() {
    return 'RecipeCollection(id: $id, userId: $userId, recipeId: $recipeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, recipeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCollectionCopyWith<_$_RecipeCollection> get copyWith =>
      __$$_RecipeCollectionCopyWithImpl<_$_RecipeCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeCollectionToJson(
      this,
    );
  }
}

abstract class _RecipeCollection implements RecipeCollection {
  const factory _RecipeCollection(
          {@JsonKey(name: '_id') final String? id,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'recipe_id') final String? recipeId}) =
      _$_RecipeCollection;

  factory _RecipeCollection.fromJson(Map<String, dynamic> json) =
      _$_RecipeCollection.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'recipe_id')
  String? get recipeId;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCollectionCopyWith<_$_RecipeCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
