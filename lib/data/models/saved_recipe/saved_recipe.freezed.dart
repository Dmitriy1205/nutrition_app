// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedRecipe _$SavedRecipeFromJson(Map<String, dynamic> json) {
  return _SavedRecipe.fromJson(json);
}

/// @nodoc
mixin _$SavedRecipe {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get recipeText => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedRecipeCopyWith<SavedRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedRecipeCopyWith<$Res> {
  factory $SavedRecipeCopyWith(
          SavedRecipe value, $Res Function(SavedRecipe) then) =
      _$SavedRecipeCopyWithImpl<$Res, SavedRecipe>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      @JsonKey(name: 'text') String? recipeText,
      String? img,
      String? date});
}

/// @nodoc
class _$SavedRecipeCopyWithImpl<$Res, $Val extends SavedRecipe>
    implements $SavedRecipeCopyWith<$Res> {
  _$SavedRecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? recipeText = freezed,
    Object? img = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeText: freezed == recipeText
          ? _value.recipeText
          : recipeText // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedRecipeCopyWith<$Res>
    implements $SavedRecipeCopyWith<$Res> {
  factory _$$_SavedRecipeCopyWith(
          _$_SavedRecipe value, $Res Function(_$_SavedRecipe) then) =
      __$$_SavedRecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? name,
      @JsonKey(name: 'text') String? recipeText,
      String? img,
      String? date});
}

/// @nodoc
class __$$_SavedRecipeCopyWithImpl<$Res>
    extends _$SavedRecipeCopyWithImpl<$Res, _$_SavedRecipe>
    implements _$$_SavedRecipeCopyWith<$Res> {
  __$$_SavedRecipeCopyWithImpl(
      _$_SavedRecipe _value, $Res Function(_$_SavedRecipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? recipeText = freezed,
    Object? img = freezed,
    Object? date = freezed,
  }) {
    return _then(_$_SavedRecipe(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      recipeText: freezed == recipeText
          ? _value.recipeText
          : recipeText // ignore: cast_nullable_to_non_nullable
              as String?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedRecipe implements _SavedRecipe {
  const _$_SavedRecipe(
      {@JsonKey(name: '_id') this.id,
      this.name,
      @JsonKey(name: 'text') this.recipeText,
      this.img,
      this.date});

  factory _$_SavedRecipe.fromJson(Map<String, dynamic> json) =>
      _$$_SavedRecipeFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'text')
  final String? recipeText;
  @override
  final String? img;
  @override
  final String? date;

  @override
  String toString() {
    return 'SavedRecipe(id: $id, name: $name, recipeText: $recipeText, img: $img, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedRecipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.recipeText, recipeText) ||
                other.recipeText == recipeText) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, recipeText, img, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedRecipeCopyWith<_$_SavedRecipe> get copyWith =>
      __$$_SavedRecipeCopyWithImpl<_$_SavedRecipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedRecipeToJson(
      this,
    );
  }
}

abstract class _SavedRecipe implements SavedRecipe {
  const factory _SavedRecipe(
      {@JsonKey(name: '_id') final String? id,
      final String? name,
      @JsonKey(name: 'text') final String? recipeText,
      final String? img,
      final String? date}) = _$_SavedRecipe;

  factory _SavedRecipe.fromJson(Map<String, dynamic> json) =
      _$_SavedRecipe.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'text')
  String? get recipeText;
  @override
  String? get img;
  @override
  String? get date;
  @override
  @JsonKey(ignore: true)
  _$$_SavedRecipeCopyWith<_$_SavedRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}
