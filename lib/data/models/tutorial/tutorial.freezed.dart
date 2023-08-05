// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tutorial _$TutorialFromJson(Map<String, dynamic> json) {
  return _Tutorial.fromJson(json);
}

/// @nodoc
mixin _$Tutorial {
  bool? get isEditMood => throw _privateConstructorUsedError;
  bool? get isFoodChoose => throw _privateConstructorUsedError;
  bool? get isRegenerateRecipe => throw _privateConstructorUsedError;
  bool? get isRecipeButton => throw _privateConstructorUsedError;
  bool? get isShowBottomBar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TutorialCopyWith<Tutorial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialCopyWith<$Res> {
  factory $TutorialCopyWith(Tutorial value, $Res Function(Tutorial) then) =
      _$TutorialCopyWithImpl<$Res, Tutorial>;
  @useResult
  $Res call(
      {bool? isEditMood,
      bool? isFoodChoose,
      bool? isRegenerateRecipe,
      bool? isRecipeButton,
      bool? isShowBottomBar});
}

/// @nodoc
class _$TutorialCopyWithImpl<$Res, $Val extends Tutorial>
    implements $TutorialCopyWith<$Res> {
  _$TutorialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditMood = freezed,
    Object? isFoodChoose = freezed,
    Object? isRegenerateRecipe = freezed,
    Object? isRecipeButton = freezed,
    Object? isShowBottomBar = freezed,
  }) {
    return _then(_value.copyWith(
      isEditMood: freezed == isEditMood
          ? _value.isEditMood
          : isEditMood // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFoodChoose: freezed == isFoodChoose
          ? _value.isFoodChoose
          : isFoodChoose // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRegenerateRecipe: freezed == isRegenerateRecipe
          ? _value.isRegenerateRecipe
          : isRegenerateRecipe // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecipeButton: freezed == isRecipeButton
          ? _value.isRecipeButton
          : isRecipeButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowBottomBar: freezed == isShowBottomBar
          ? _value.isShowBottomBar
          : isShowBottomBar // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TutorialCopyWith<$Res> implements $TutorialCopyWith<$Res> {
  factory _$$_TutorialCopyWith(
          _$_Tutorial value, $Res Function(_$_Tutorial) then) =
      __$$_TutorialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? isEditMood,
      bool? isFoodChoose,
      bool? isRegenerateRecipe,
      bool? isRecipeButton,
      bool? isShowBottomBar});
}

/// @nodoc
class __$$_TutorialCopyWithImpl<$Res>
    extends _$TutorialCopyWithImpl<$Res, _$_Tutorial>
    implements _$$_TutorialCopyWith<$Res> {
  __$$_TutorialCopyWithImpl(
      _$_Tutorial _value, $Res Function(_$_Tutorial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEditMood = freezed,
    Object? isFoodChoose = freezed,
    Object? isRegenerateRecipe = freezed,
    Object? isRecipeButton = freezed,
    Object? isShowBottomBar = freezed,
  }) {
    return _then(_$_Tutorial(
      isEditMood: freezed == isEditMood
          ? _value.isEditMood
          : isEditMood // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFoodChoose: freezed == isFoodChoose
          ? _value.isFoodChoose
          : isFoodChoose // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRegenerateRecipe: freezed == isRegenerateRecipe
          ? _value.isRegenerateRecipe
          : isRegenerateRecipe // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRecipeButton: freezed == isRecipeButton
          ? _value.isRecipeButton
          : isRecipeButton // ignore: cast_nullable_to_non_nullable
              as bool?,
      isShowBottomBar: freezed == isShowBottomBar
          ? _value.isShowBottomBar
          : isShowBottomBar // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tutorial implements _Tutorial {
  const _$_Tutorial(
      {this.isEditMood,
      this.isFoodChoose,
      this.isRegenerateRecipe,
      this.isRecipeButton,
      this.isShowBottomBar});

  factory _$_Tutorial.fromJson(Map<String, dynamic> json) =>
      _$$_TutorialFromJson(json);

  @override
  final bool? isEditMood;
  @override
  final bool? isFoodChoose;
  @override
  final bool? isRegenerateRecipe;
  @override
  final bool? isRecipeButton;
  @override
  final bool? isShowBottomBar;

  @override
  String toString() {
    return 'Tutorial(isEditMood: $isEditMood, isFoodChoose: $isFoodChoose, isRegenerateRecipe: $isRegenerateRecipe, isRecipeButton: $isRecipeButton, isShowBottomBar: $isShowBottomBar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tutorial &&
            (identical(other.isEditMood, isEditMood) ||
                other.isEditMood == isEditMood) &&
            (identical(other.isFoodChoose, isFoodChoose) ||
                other.isFoodChoose == isFoodChoose) &&
            (identical(other.isRegenerateRecipe, isRegenerateRecipe) ||
                other.isRegenerateRecipe == isRegenerateRecipe) &&
            (identical(other.isRecipeButton, isRecipeButton) ||
                other.isRecipeButton == isRecipeButton) &&
            (identical(other.isShowBottomBar, isShowBottomBar) ||
                other.isShowBottomBar == isShowBottomBar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isEditMood, isFoodChoose,
      isRegenerateRecipe, isRecipeButton, isShowBottomBar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TutorialCopyWith<_$_Tutorial> get copyWith =>
      __$$_TutorialCopyWithImpl<_$_Tutorial>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TutorialToJson(
      this,
    );
  }
}

abstract class _Tutorial implements Tutorial {
  const factory _Tutorial(
      {final bool? isEditMood,
      final bool? isFoodChoose,
      final bool? isRegenerateRecipe,
      final bool? isRecipeButton,
      final bool? isShowBottomBar}) = _$_Tutorial;

  factory _Tutorial.fromJson(Map<String, dynamic> json) = _$_Tutorial.fromJson;

  @override
  bool? get isEditMood;
  @override
  bool? get isFoodChoose;
  @override
  bool? get isRegenerateRecipe;
  @override
  bool? get isRecipeButton;
  @override
  bool? get isShowBottomBar;
  @override
  @JsonKey(ignore: true)
  _$$_TutorialCopyWith<_$_Tutorial> get copyWith =>
      throw _privateConstructorUsedError;
}
