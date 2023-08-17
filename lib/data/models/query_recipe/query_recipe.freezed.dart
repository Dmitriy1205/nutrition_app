// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QueryRecipe _$QueryRecipeFromJson(Map<String, dynamic> json) {
  return _QueryRecipe.fromJson(json);
}

/// @nodoc
mixin _$QueryRecipe {
  String? get recipeName => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get recipeBody => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryRecipeCopyWith<QueryRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryRecipeCopyWith<$Res> {
  factory $QueryRecipeCopyWith(
          QueryRecipe value, $Res Function(QueryRecipe) then) =
      _$QueryRecipeCopyWithImpl<$Res, QueryRecipe>;
  @useResult
  $Res call(
      {String? recipeName,
      String? image,
      String? recipeBody,
      String? dateTime});
}

/// @nodoc
class _$QueryRecipeCopyWithImpl<$Res, $Val extends QueryRecipe>
    implements $QueryRecipeCopyWith<$Res> {
  _$QueryRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeName = freezed,
    Object? image = freezed,
    Object? recipeBody = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      recipeName: freezed == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeBody: freezed == recipeBody
          ? _value.recipeBody
          : recipeBody // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryRecipeCopyWith<$Res>
    implements $QueryRecipeCopyWith<$Res> {
  factory _$$_QueryRecipeCopyWith(
          _$_QueryRecipe value, $Res Function(_$_QueryRecipe) then) =
      __$$_QueryRecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? recipeName,
      String? image,
      String? recipeBody,
      String? dateTime});
}

/// @nodoc
class __$$_QueryRecipeCopyWithImpl<$Res>
    extends _$QueryRecipeCopyWithImpl<$Res, _$_QueryRecipe>
    implements _$$_QueryRecipeCopyWith<$Res> {
  __$$_QueryRecipeCopyWithImpl(
      _$_QueryRecipe _value, $Res Function(_$_QueryRecipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeName = freezed,
    Object? image = freezed,
    Object? recipeBody = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_QueryRecipe(
      recipeName: freezed == recipeName
          ? _value.recipeName
          : recipeName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeBody: freezed == recipeBody
          ? _value.recipeBody
          : recipeBody // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryRecipe implements _QueryRecipe {
  const _$_QueryRecipe(
      {this.recipeName, this.image, this.recipeBody, this.dateTime});

  factory _$_QueryRecipe.fromJson(Map<String, dynamic> json) =>
      _$$_QueryRecipeFromJson(json);

  @override
  final String? recipeName;
  @override
  final String? image;
  @override
  final String? recipeBody;
  @override
  final String? dateTime;

  @override
  String toString() {
    return 'QueryRecipe(recipeName: $recipeName, image: $image, recipeBody: $recipeBody, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryRecipe &&
            (identical(other.recipeName, recipeName) ||
                other.recipeName == recipeName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.recipeBody, recipeBody) ||
                other.recipeBody == recipeBody) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, recipeName, image, recipeBody, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryRecipeCopyWith<_$_QueryRecipe> get copyWith =>
      __$$_QueryRecipeCopyWithImpl<_$_QueryRecipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryRecipeToJson(
      this,
    );
  }
}

abstract class _QueryRecipe implements QueryRecipe {
  const factory _QueryRecipe(
      {final String? recipeName,
      final String? image,
      final String? recipeBody,
      final String? dateTime}) = _$_QueryRecipe;

  factory _QueryRecipe.fromJson(Map<String, dynamic> json) =
      _$_QueryRecipe.fromJson;

  @override
  String? get recipeName;
  @override
  String? get image;
  @override
  String? get recipeBody;
  @override
  String? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_QueryRecipeCopyWith<_$_QueryRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}
